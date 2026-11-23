# Phase 0 harness check: or-gptoss120b-50x4

- **Problems:** 50 from FormalMATH-Lite, spread over topics as the full set is (`bench/problems.json`).
- **Agent:** `openai/gpt-oss-120b` via openrouter, effort medium, replies up to 32000 tokens. One attempt is a first proof plus up to 2 repairs on Lean's errors.
- **Checker:** Lean 4.35 with Mathlib v4.35.0; the statement is never changed; only Lean's standard axioms are allowed.
- **Money:** what the provider charged.

| | Solved | Rate |
| --- | --- | --- |
| One agent (first attempt) | 12 of 50 | 24% |
| Independent agents (any of 4) | 17 of 50 | 34% |

**Cost:** $0.10 in all, $0.006 per problem solved; 2.43M tokens; 114 minutes.

| Topic | Problems | Solved |
| --- | --- | --- |
| algebra | 30 | 9 |
| applied | 6 | 4 |
| calculus | 4 | 2 |
| combinatorics | 3 | 0 |
| geometry | 2 | 0 |
| number theory | 5 | 2 |

**Why attempts failed:** no proof in the reply 32; Lean rejected the proof 115.

Records: `records.jsonl` (one line per attempt, in the order they finished, for the cost-vs-solved graph).
