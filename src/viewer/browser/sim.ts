// The simulation for the public copy of the app, bundled for the browser (scripts/export-site.ts): the page
// replays any saved setup at any seed without a server. The engine's file reading is never reached, since
// the export writes every world into its scenario.
import type { Scenario } from '../../engine/config.ts';
import { replay, type ReplaySpace } from '../replay.ts';

export function run(saved: { scenario: Scenario; space: ReplaySpace; setting: { id: string; label: string } }, seed: number) {
  return replay(saved.scenario, seed, saved.space, saved.setting);
}
