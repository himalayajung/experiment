// One traced run as the page replays it, round by round. Shared by the viewer's server and the public copy,
// which runs the same simulation in the browser (src/viewer/browser/sim.ts).
import type { Scenario } from '../engine/config.ts';
import { traceRun } from '../engine/model.ts';

export interface ReplaySpace { id: string; title: string; glossary: unknown; areas: unknown[] }

export function replay(sc: Scenario, seed: number, space: ReplaySpace, setting: { id: string; label: string }) {
  const t = traceRun(sc, seed);
  const w = t.world;
  return {
    space, setting, seed,
    budget: { X: sc.budget.X, rounds: sc.budget.rounds },
    world: { n: w.n, levels: w.levels, level: w.level, area: w.area, prereqs: w.prereqs, isTarget: w.isTarget, bounty: w.bounty, deadEnd: w.deadEnd, names: w.names ?? null, p: w.p, bits: w.bits ?? null, tosses: w.tosses ?? null },
    agents: t.agents.map((a) => ({ id: a.id, archetype: a.archetype })),
    events: t.events,
    result: { frontier: t.result.frontier, targetsSolved: t.result.targetsSolved, spend: t.result.spend, sharing: t.result.sharingRate },
  };
}
