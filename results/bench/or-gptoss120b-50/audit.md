# Why attempts failed: or-gptoss120b-50

13 of 50 scored attempts proved. Of the 37 that failed:

| Whose fault | Failures |
| --- | --- |
| Our harness (a proof lost or cut short) | 0 |
| The benchmark (statement looks false) | 6 |
| The model (Lean rejected its proof) | 31 |

| Problem | Whose fault | Why | Lean said |
| --- | --- | --- | --- |
| omni_theorem_2597 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1080 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_3054 | model | tactics did not close the goal (our feedback wrongly said "in the statement"; fixed 2026-11-06) | line 5 of your proof, column 4: Type mismatch: After simplification, term |
| omni_theorem_2816 | model | Lean syntax error | line 6 of your proof, column 6: Type mismatch: After simplification, term |
| theorem_proving_zh_blue_1247 | model | tactics did not close the goal | line 2 of your proof, column 2: linarith failed to find a contradiction |
| aime_all_1993_4 | model | a Mathlib name that does not exist (an older or invented name) | line 3 of your proof, column 9: Unknown constant `Set.ncard_eq_fintype_card` |
| omni_theorem_4105 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| u-math_1044 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_1580 | benchmark | the model says the statement is false (and still tried) | line 1 of your proof, column 3: unknown tactic |
| quantitative_reasoning_zh_blue_805 | model | a Mathlib name that does not exist (an older or invented name) | line 14 of your proof, column 4: unsolved goals |
| theorem_proving_zh_blue_1576 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_388 | model | tactics did not close the goal (our feedback wrongly said "in the statement"; fixed 2026-11-06) | line 2 of your proof, column 29: unexpected identifier; expected 'in' |
| theorem_proving_zh_blue_1281 | model | Lean syntax error | line 10 of your proof, column 8: linarith failed to find a contradiction |
| omni_theorem_639 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| u-math_389 | model | a Mathlib name that does not exist (an older or invented name) | line 2 of your proof, column 14: Unknown constant `Real.tendsto_sin_div_self_pow` |
| quantitative_reasoning_zh_blue_396 | model | tactics did not close the goal | line 12 of your proof, column 77: unsolved goals |
| omni_theorem_3016 | model | tactics did not close the goal | line 10 of your proof, column 15: failed to synthesize instance of type class |
| u-math_483 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_534 | model | other Lean error: line 2 of your proof, column 2: maximum recursion depth has  | line 2 of your proof, column 2: maximum recursion depth has been reached |
| omni_theorem_933 | model | tactics did not close the goal | line 5 of your proof, column 6: Tactic `decide` failed to reduce |
| u-math_234 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| quantitative_reasoning_zh_blue_880 | model | tactics did not close the goal | line 32 of your proof, column 8: linarith failed to find a contradiction |
| u-math_1027 | model | other Lean error: line 8 of your proof, column 50: Invalid field `mp`: The env | line 8 of your proof, column 50: Invalid field `mp`: The environment does not contain `Fun |
| omni_theorem_2364 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| u-math_1091 | model | tactics did not close the goal (our feedback wrongly said "in the statement"; fixed 2026-11-06) | in the statement: unsolved goals |
| u-math_408 | model | a Mathlib name that does not exist (an older or invented name) | line 15 of your proof, column 6: Type mismatch |
| omni_theorem_629 | benchmark | the model says the statement is false (and still tried) | line 1 of your proof, column 5: unknown tactic |
| omni_theorem_915 | model | tactics did not close the goal | line 3 of your proof, column 2: Tactic `decide` failed to reduce |
| quantitative_reasoning_zh_blue_68 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1134 | model | Lean syntax error | line 17 of your proof, column 42: Application type mismatch: The argument |
| quantitative_reasoning_zh_blue_37 | model | tactics did not close the goal (our feedback wrongly said "in the statement"; fixed 2026-11-06) | line 28 of your proof, column 38: unexpected token '}'; expected '⟩' |
| aime_all_2007_I_2 | model | tactics did not close the goal | line 52 of your proof, column 12: expected token |
| aime_all_2018_I_11 | model | other Lean error: line 1 of your proof, column 2: maximum recursion depth has  | line 1 of your proof, column 2: maximum recursion depth has been reached |
| aime_all_2015_II_3 | model | other Lean error: line 2 of your proof, column 2: maximum recursion depth has  | line 2 of your proof, column 2: maximum recursion depth has been reached |
| omni_theorem_4271 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_2243 | model | a Mathlib name that does not exist (an older or invented name) | line 7 of your proof, column 42: linarith failed to find a contradiction |
| omni_theorem_1308 | model | no proof in the reply | no ```lean block with a proof of this theorem |

Sorted from each attempt's transcript by fixed rules (src/bench/audit.ts); read the transcripts for the harness and benchmark rows.
