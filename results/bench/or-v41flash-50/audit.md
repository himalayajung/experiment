# Why attempts failed: or-v41flash-50

1 of 3 attempts proved. Of the 5 failures:

| Whose fault | Failures |
| --- | --- |
| Our harness (a proof lost or cut short) | 0 |
| The benchmark (statement looks false) | 1 |
| The model (Lean rejected its proof) | 1 |
| Not scored (a call failed) | 3 |

| Problem | Whose fault | Why | Lean said |
| --- | --- | --- | --- |
| omni_theorem_3054 | model | tactics did not close the goal | line 3 of your proof, column 44: omega could not prove the goal: |
| omni_theorem_2597 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_2816 | run | a model call failed (not scored) |  |
| theorem_proving_zh_blue_1080 | run | a model call failed (not scored) |  |
| theorem_proving_zh_blue_1247 | run | a model call failed (not scored) |  |

Sorted from each attempt's transcript by fixed rules (src/bench/audit.ts); read the transcripts for the harness and benchmark rows.
