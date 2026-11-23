# Phase 0 harness check: or-v41flash-50

**Stopped early (out of credit):** 3 of 50 problems tried; rates below are of those tried.

- **Problems:** 50 from FormalMATH-Lite, spread over topics as the full set is (`bench/problems.json`).
- **Agent:** `deepseek/deepseek-v4.1-flash` via openrouter, effort medium, replies up to 32000 tokens. One attempt is a first proof plus up to 2 repairs on Lean's errors.
- **Checker:** Lean 4.35 with Mathlib v4.35.0; the statement is never changed; only Lean's standard axioms are allowed.
- **Money:** what the provider charged.

| | Solved | Rate |
| --- | --- | --- |
| One agent (first attempt) | 1 of 3 | 33% |

**Cost:** $0.03 in all, $0.025 per problem solved; 0.13M tokens; 6 minutes.

| Topic | Problems | Solved |
| --- | --- | --- |
| algebra | 30 | 1 |
| applied | 6 | 0 |
| calculus | 4 | 0 |
| combinatorics | 3 | 0 |
| geometry | 2 | 0 |
| number theory | 5 | 0 |

**Why attempts failed:** Lean rejected the proof 1; no proof in the reply 1.

Records: `records.jsonl` (one line per attempt, in the order they finished, for the cost-vs-solved graph).
