// The list of experiments on the Live page: `node scripts/live-index.ts <live branch folder>`.
// Reads every experiments/<id>.json there and writes index.json (newest first). live.json stays a copy of the
// newest running experiment, for pages that still read it.
import { copyFileSync, existsSync, readdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

const dir = process.argv[2];
if (!dir) { console.error('usage: node scripts/live-index.ts <live branch folder>'); process.exit(1); }
const folder = join(dir, 'experiments');
const experiments = (existsSync(folder) ? readdirSync(folder) : []).filter((f) => f.endsWith('.json')).map((f) => {
  const d = JSON.parse(readFileSync(join(folder, f), 'utf8'));
  const runs = d.setups.reduce((a: { done: number; total: number }, s: { runs: { done: number; total: number } }) => ({ done: a.done + s.runs.done, total: a.total + s.runs.total }), { done: 0, total: 0 });
  return { id: d.id, title: d.title, file: `experiments/${f}`, updatedAt: d.updatedAt, startedAt: d.startedAt, running: runs.done < runs.total, runs, setups: d.setups.length, problems: d.targets.length };
}).sort((a, b) => Number(b.running) - Number(a.running) || b.updatedAt - a.updatedAt);
writeFileSync(join(dir, 'index.json'), JSON.stringify({ updatedAt: Date.now(), experiments }) + '\n');
if (experiments[0]) copyFileSync(join(dir, experiments[0].file), join(dir, 'live.json'));
console.log(experiments.map((e) => `${e.id} ${e.running ? 'running' : 'finished'} ${e.runs.done}/${e.runs.total}`).join('\n'));
