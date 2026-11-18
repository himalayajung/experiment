// Reference prices: what a Lean run's money means, whatever a provider charged on the day.
// OpenRouter sends a model's calls to companies with different prices, and those prices change: DeepSeek V4.1
// Flash cost about $0.20 per million output tokens to 2026-11-08 and $0.30–0.40 from 2026-11-09, with the same
// tokens per try. Budgets in dollars then bought half the thinking, and money to reach K targets doubled.
// So money is counted at one fixed price per token per model: in new runs the budgets too, in old runs when they
// are read (repriced). What OpenRouter actually charged stays in each call's usage.cost (credit used).
import type { Usage } from './agent.ts';

/** Dollars per token. DeepSeek V4.1 Flash: fitted to the charges of every run to 2026-11-08 (Spend all, Labs choose). */
export const REFERENCE_PRICES: Record<string, { input: number; output: number; cacheRead: number }> = {
  'deepseek/deepseek-v4.1-flash': { input: 0.06e-6, output: 0.2e-6, cacheRead: 0.006e-6 },
};

/** A call's cost at the model's reference price; null when the model has none (then its charge is used). */
export function referenceCost(model: string, u: Pick<Usage, 'input' | 'output' | 'cacheRead'>): number | null {
  const p = REFERENCE_PRICES[model];
  return p ? u.input * p.input + u.output * p.output + u.cacheRead * p.cacheRead : null;
}
