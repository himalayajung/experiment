// A live snapshot of an experiment, for the Live page on oso.network: `node scripts/live-snapshot.ts <id> [out.json]`.
// Reads lean/runs/<id>.plan.json and each run's action log while the runs go. Only what the checker
// decided goes out (targets and lemmas proved or not, money spent): no proofs, no model thinking.
import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { costOf, type Action, type CommunityOptions } from '../src/lean/community.ts';
import { EXPERIMENT_NAMES } from '../src/lean/names.ts';
import { osoLabel, osoParams } from '../src/lean/societies.ts';
import { LEAN_DIR, loadTasks } from '../src/lean/tasks.ts';

const [id, out = 'live.json'] = process.argv.slice(2);
if (!id) { console.error('usage: node scripts/live-snapshot.ts <experiment id> [out.json]'); process.exit(1); }
const runs = join(LEAN_DIR, 'runs');
const plan = JSON.parse(readFileSync(join(runs, `${id}.plan.json`), 'utf8')) as { societies: string[]; repeats: number; startedAt: number };
const lines = (f: string) => (existsSync(f) ? readFileSync(f, 'utf8').split('\n').filter(Boolean).map((l) => JSON.parse(l)) : []);

// Money points for the line graph: mean targets proved by each setup once each run has spent that much.
const GRID = 40;
let problems: CommunityOptions['problems'] = 'main', cap = 0;
const setups = plan.societies.map((key) => {
  let opts: CommunityOptions | null = null;
  const reps = Array.from({ length: plan.repeats }, (_, k) => {
    const dir = join(runs, `${id}-r${k + 1}-${key}`);
    if (!existsSync(join(dir, 'options.json'))) return { rep: k + 1, status: 'waiting' as const, round: 0, spent: 0, targets: [] as string[], lemmas: 0, steps: [] as [number, number][] };
    opts ??= JSON.parse(readFileSync(join(dir, 'options.json'), 'utf8')) as CommunityOptions;
    problems = opts.problems ?? 'main';
    cap = opts.budget * opts.agents.length;
    const actions = lines(join(dir, 'actions.jsonl')) as Action[];
    let spent = 0;
    const targets: string[] = [], steps: [number, number][] = [[0, 0]];
    for (const a of actions) {
      spent += costOf(a);
      if (a.kind === 'target' && a.ok && a.target && !a.reason?.includes('duplicate') && !targets.includes(a.target)) { targets.push(a.target); steps.push([spent, targets.length]); }
    }
    return {
      rep: k + 1, status: existsSync(join(dir, 'result.json')) ? 'done' as const : 'running' as const,
      round: Math.max(0, ...actions.map((a) => a.round)), spent, targets,
      lemmas: actions.filter((a) => a.kind === 'lemma' && a.ok).length, steps,
    };
  });
  return { key, label: opts ? osoLabel(key, opts) : key, params: opts ? osoParams(opts) : '', reps };
});

const at = (steps: [number, number][], money: number) => steps.filter(([m]) => m <= money).at(-1)?.[1] ?? 0;
const tasks = loadTasks(problems).filter((t) => t.posted);
const feed = plan.societies.flatMap((key) => Array.from({ length: plan.repeats }, (_, k) =>
  (lines(join(runs, `${id}-r${k + 1}-${key}`, 'actions.jsonl')) as Action[])
    .filter((a) => a.kind === 'target' || a.kind === 'lemma')
    .map((a) => ({ t: a.t, setup: key, run: k + 1, lab: a.agent + 1, kind: a.kind, item: a.kind === 'target' ? a.target : a.name, ok: a.ok, duplicate: !!a.reason?.includes('duplicate') })),
).flat()).sort((a, b) => (b.t ?? 0) - (a.t ?? 0)).slice(0, 60);

const snapshot = {
  id, title: EXPERIMENT_NAMES[id] ?? id, updatedAt: Date.now(), startedAt: plan.startedAt,
  problems, moneyPerRun: cap,
  targets: tasks.map((t) => ({ id: t.publicId, depth: t.depth, bounty: 4 * 2 ** (t.depth - 1), area: t.area })),
  setups: setups.map((s) => {
    const started = s.reps.filter((r) => r.status !== 'waiting');
    return {
      key: s.key, label: s.label, params: s.params,
      runs: { done: s.reps.filter((r) => r.status === 'done').length, running: s.reps.filter((r) => r.status === 'running').length, total: plan.repeats },
      // Line graph: mean over started runs of targets proved for the money spent, money as a share of a run's money.
      curve: started.length ? Array.from({ length: GRID + 1 }, (_, g) => { const m = cap * g / GRID; return [m, started.reduce((a, r) => a + at(r.steps, m), 0) / started.length]; }) : [],
      // How many runs proved each target.
      proved: Object.fromEntries(tasks.map((t) => [t.publicId, s.reps.filter((r) => r.targets.includes(t.publicId)).length])),
      reps: s.reps.map(({ steps: _, ...r }) => r),
    };
  }),
  feed,
};
writeFileSync(out, JSON.stringify(snapshot) + '\n');
console.log(`${out}: ${setups.map((s) => `${s.key} ${s.reps.filter((r) => r.status !== 'waiting').length}/${plan.repeats} started`).join(', ')}`);
