# Phase 0 harness check: local-phase0-try1

- **Problems:** 5 from FormalMATH-Lite, spread over topics as the full set is (`bench/problems.json`).
- **Agent:** `hf.co/mradermacher/Goedel-Prover-V2-8B-GGUF:Q4_K_M` via local, effort medium, replies up to 8000 tokens. One attempt is a first proof plus up to 1 repairs on Lean's errors.
- **Checker:** Lean 4.35 with Mathlib v4.35.0; the statement is never changed; only Lean's standard axioms are allowed.
- **Money:** a model on this machine costs nothing; dollars here price its tokens as a cheap open model would be served ($0.10 / $0.40 per million tokens in / out).

| | Solved | Rate |
| --- | --- | --- |
| One agent (first attempt) | 2 of 5 | 40% |

**Cost:** $0.03 in all, $0.015 per problem solved; 0.10M tokens; 113 minutes.

| Topic | Problems | Solved |
| --- | --- | --- |
| algebra | 5 | 2 |

**Why attempts failed:** reply too long 3.

Records: `records.jsonl` (one line per attempt, in the order they finished, for the cost-vs-solved graph).
