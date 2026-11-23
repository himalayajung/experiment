// The public, read-only copy of the app: every page that only reads results (simulations, Lean experiments,
// findings, documents), with the numbers behind them, and no server. Run with the viewer running: npm run site.
// Writes site/. Each call the page makes is saved as site/data/api/<key>.json (the key: src/viewer/index.html,
// staticKey). Left out: anything that starts a run, the account's money, runs still going, model thinking, and
// the private roadmap (it lives in the local notes). Only Lean experiments whose runs have all finished go in.
import { cpSync, existsSync, mkdirSync, readdirSync, readFileSync, rmSync, statSync, writeFileSync } from 'node:fs';
import { dirname, join, relative } from 'node:path';
import { build } from 'esbuild';

const VIEWER = process.env.VIEWER ?? 'http://127.0.0.1:8791', OUT = 'site';
// The same key as staticKey in src/viewer/index.html.
const staticKey = (path: string) => decodeURIComponent(path).replace(/^\/api\//, '').replace(/[^A-Za-z0-9.-]+/g, '_');
const get = async (path: string) => { const r = await fetch(VIEWER + path); if (!r.ok) throw new Error(`${path}: ${r.status}`); return r.json(); };
// Paths in saved data and documents point at the server (/files/…, /katex/…); the copy serves them beside the page.
const local = (text: string) => text.replace(/(["'(])\/(files|katex)\//g, '$1$2/');
const files = new Set<string>();
const save = (path: string, data: unknown) => {
  const text = local(JSON.stringify(data));
  for (const m of text.matchAll(/files\/([^"'?#)\s\\]+)/g)) files.add(decodeURIComponent(m[1]));
  writeFileSync(join(OUT, 'data', 'api', `${staticKey(path)}.json`), text);
};
const saveGet = async (path: string) => { const d = await get(path); save(path, d); return d; };
const q = encodeURIComponent;

rmSync(join(OUT, 'data'), { recursive: true, force: true });
mkdirSync(join(OUT, 'data', 'api'), { recursive: true });
let n = 0;
const count = <T>(x: T) => { n++; return x; };

// Pages that read the whole picture.
for (const p of ['/api/overview', '/api/history', '/api/model', '/api/settings', '/api/presets', '/api/pilot/runs']) count(await saveGet(p));
save('/api/roadmap', { milestones: [], aim: '' }); // private: the notes are never published

// Simulations: every experiment's rows and each row's scenario, every space with each setting, and each result
// card's charts. Replays are not saved: the page runs the simulation in the browser (site/sim.js) at any seed.
const spaces = count(await saveGet('/api/spaces')) as { id: string }[];
const settings = (await get('/api/settings')) as { id: string }[] | Record<string, unknown>;
const settingIds = Array.isArray(settings) ? settings.map((s) => s.id) : Object.keys(settings);
for (const s of spaces) for (const id of settingIds) count(await saveGet(`/api/sim/scenario?space=${q(s.id)}&setting=${q(id)}`).catch(() => null));
const sims = count(await saveGet('/api/sim/experiments')) as { id: string }[];
for (const e of sims) {
  const r = count(await saveGet(`/api/sim/rows?experiment=${q(e.id)}`)) as { rows: string[]; firstSeed: number };
  for (let row = 0; row < r.rows.length; row++) count(await saveGet(`/api/sim/scenario?experiment=${q(e.id)}&row=${row}`));
}
const overview = (await get('/api/overview')) as { cards: { id: string; kind: string }[] };
for (const c of overview.cards) count(await saveGet(`/api/result-data?id=${q(c.id)}`));

// Lean: finished experiments, the problem sets, and the model checks (pilot runs).
type Setup = { runs: number; done: number; series: unknown[] };
type Experiment = { id: string; name: string; test: boolean };
const first = await get('/api/lean');
const finished: { meta: Experiment; data: Record<string, unknown> }[] = [];
for (const meta of first.experiments as Experiment[]) {
  if (meta.test) continue;
  const data = await get(`/api/lean?exp=${q(meta.id)}`), setups = data.setups as Setup[];
  if (setups.length && setups.some((s) => s.series.length) && setups.every((s) => s.done === s.runs)) finished.push({ meta, data });
}
if (!finished.length) throw new Error('no finished Lean experiments');
const list = finished.map((x) => x.meta);
for (const { meta, data } of finished) count(save(`/api/lean?exp=${q(meta.id)}`, { ...data, experiments: list }));
save('/api/lean', { ...finished[0].data, experiments: list });
save('/api/lean?exp=', { ...finished[0].data, experiments: list });
for (const set of ['main', 'hard', 'big']) count(await saveGet(`/api/problems?set=${set}`));
for (const r of (await get('/api/pilot/runs')) as { id: string }[]) count(await saveGet(`/api/pilot/run?id=${q(r.id)}`).catch(() => null));

// Every public document.
const md = (dir: string): string[] => readdirSync(dir).flatMap((f) => {
  const p = join(dir, f);
  return statSync(p).isDirectory() ? md(p) : f.endsWith('.md') ? [relative('.', p)] : [];
});
const docs = ['README.md', 'lean/README.md', ...['docs', 'results', 'reports', 'config', 'spaces', 'worlds'].filter(existsSync).flatMap(md)]
  .filter((p) => !/(^|\/)(NOTES|HANDOFF)\.md$/.test(p) && !/stub-/.test(p));
for (const path of docs) count(await saveGet(`/api/doc?path=${q(path)}`).catch(() => null));

// The figures and files the pages show, and the maths fonts.
let copied = 0;
for (const f of files) {
  if (f.includes('..') || f.startsWith('/') || !existsSync(f) || statSync(f).isDirectory() || /^(notes|lean\/runs|lean\/NOTES)/.test(f)) continue;
  mkdirSync(join(OUT, 'files', dirname(f)), { recursive: true });
  cpSync(f, join(OUT, 'files', f)); copied++;
}
cpSync('node_modules/katex/dist/katex.min.css', join(OUT, 'katex', 'katex.min.css'));
cpSync('node_modules/katex/dist/fonts', join(OUT, 'katex', 'fonts'), { recursive: true });

// The simulation, for replays in the browser; the engine's Node imports are never reached there.
const stub = 'src/viewer/browser/node-stub.ts';
await build({ entryPoints: ['src/viewer/browser/sim.ts'], bundle: true, format: 'esm', platform: 'browser', minify: true, outfile: join(OUT, 'sim.js'), logLevel: 'warning',
  alias: { 'node:fs': `./${stub}`, 'node:path': `./${stub}`, 'node:url': `./${stub}`, 'node:crypto': `./${stub}` } });
writeFileSync(join(OUT, 'index.html'), local(readFileSync('src/viewer/index.html', 'utf8')).replace('<body>', '<body class="static">'));
writeFileSync(join(OUT, '.nojekyll'), '');
console.log(`${n} saved calls, ${docs.length} documents, ${copied} files; ${sims.length} simulation experiments; Lean: ${list.map((e) => e.id).join(', ')}`);
