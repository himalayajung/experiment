# Why attempts failed: or-gptoss120b-50x4

53 of 200 scored attempts proved. Of the 147 that failed:

| Whose fault | Failures |
| --- | --- |
| Our harness (a proof lost or cut short) | 0 |
| The benchmark (statement looks false) | 18 |
| The model (Lean rejected its proof) | 129 |

| Problem | Whose fault | Why | Lean said |
| --- | --- | --- | --- |
| theorem_proving_zh_blue_1080 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1080 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1080 | model | refused by the screen: `sorry` and `admit` are not allowed | `sorry` and `admit` are not allowed |
| theorem_proving_zh_blue_1080 | model | a Mathlib name that does not exist (an older or invented name) | line 9 of your proof, column 13: Unknown constant `Finset.card_Icc` |
| omni_theorem_3054 | model | Lean syntax error | line 12 of your proof, column 20: expected no space before |
| omni_theorem_3054 | model | Lean syntax error | line 23 of your proof, column 20: expected no space before |
| omni_theorem_2597 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_3054 | model | tactics did not close the goal | line 28 of your proof, column 24: unexpected token ':'; expected ']' |
| omni_theorem_2597 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_2597 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1247 | model | tactics did not close the goal | line 4 of your proof, column 2: linarith failed to find a contradiction |
| omni_theorem_2597 | model | other Lean error: line 2 of your proof, column 24: Tactic `decide` proved that | line 2 of your proof, column 24: Tactic `decide` proved that the proposition |
| theorem_proving_zh_blue_1247 | model | Lean syntax error | line 3 of your proof, column 4: Type mismatch: After simplification, term |
| theorem_proving_zh_blue_1247 | model | tactics did not close the goal | line 12 of your proof, column 4: linarith failed to find a contradiction |
| theorem_proving_zh_blue_1247 | model | tactics did not close the goal | line 5 of your proof, column 2: linarith failed to find a contradiction |
| omni_theorem_2816 | model | Lean syntax error | line 6 of your proof, column 4: Type mismatch: After simplification, term |
| omni_theorem_2816 | model | tactics did not close the goal | line 6 of your proof, column 4: Type mismatch: After simplification, term |
| aime_all_1993_4 | model | tactics did not close the goal | line 4 of your proof, column 6: failed to synthesize instance of type class |
| aime_all_1993_4 | model | tactics did not close the goal | line 3 of your proof, column 2: Tactic `decide` failed to reduce |
| aime_all_1993_4 | model | tactics did not close the goal | line 2 of your proof, column 2: Tactic `decide` failed to reduce |
| omni_theorem_4105 | benchmark | the model says the statement is false (and still tried) | line 21 of your proof, column 37: Expected type must not contain free variables |
| omni_theorem_4105 | model | tactics did not close the goal | line 3 of your proof, column 36: unsolved goals |
| omni_theorem_4105 | model | other Lean error: line 7 of your proof, column 16: Expected type must not cont | line 7 of your proof, column 16: Expected type must not contain free variables |
| aime_all_1993_4 | model | tactics did not close the goal | line 7 of your proof, column 14: Invalid projection: Projections extract constructor field |
| omni_theorem_4105 | model | tactics did not close the goal | line 7 of your proof, column 41: unsolved goals |
| quantitative_reasoning_zh_blue_558 | model | a Mathlib name that does not exist (an older or invented name) | line 9 of your proof, column 6: Type mismatch: After simplification, term |
| u-math_1044 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| quantitative_reasoning_zh_blue_558 | model | a Mathlib name that does not exist (an older or invented name) | line 9 of your proof, column 4: Type mismatch: After simplification, term |
| u-math_1044 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| quantitative_reasoning_zh_blue_558 | model | Lean syntax error | line 9 of your proof, column 4: Type mismatch: After simplification, term |
| u-math_1044 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| u-math_1044 | benchmark | the model says the statement is false (and still tried) | line 9 of your proof, column 2: Type mismatch: After simplification, term |
| quantitative_reasoning_zh_blue_805 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| quantitative_reasoning_zh_blue_805 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_1580 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| quantitative_reasoning_zh_blue_805 | model | tactics did not close the goal | line 14 of your proof, column 8: unsolved goals |
| quantitative_reasoning_zh_blue_805 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_1580 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_1580 | benchmark | the model says the statement is false (and still tried) | line 8 of your proof, column 13: Unknown constant `Set.ncard_le_of_subset` |
| omni_theorem_1580 | benchmark | the model says the statement is false (and still tried) | line 1 of your proof, column 4: unknown tactic |
| theorem_proving_zh_blue_1576 | model | a Mathlib name that does not exist (an older or invented name) | line 13 of your proof, column 6: unsolved goals |
| theorem_proving_zh_blue_1576 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1576 | model | a Mathlib name that does not exist (an older or invented name) | line 35 of your proof, column 7: Unknown constant `Finset.sum_mul_sign_sq_eq_card_mul_sum_ |
| theorem_proving_zh_blue_1281 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1576 | model | proof too heavy: Lean's own work limit | line 8 of your proof, column 4: Tactic `rfl` failed: The left-hand side |
| theorem_proving_zh_blue_1281 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| theorem_proving_zh_blue_1281 | model | Lean syntax error | line 16 of your proof, column 4: Type mismatch: After simplification, term |
| omni_theorem_388 | model | other Lean error: line 8 of your proof, column 4: maximum recursion depth has  | line 8 of your proof, column 4: maximum recursion depth has been reached |
| theorem_proving_zh_blue_1281 | model | a Mathlib name that does not exist (an older or invented name) | line 5 of your proof, column 4: linarith failed to find a contradiction |
| omni_theorem_388 | model | other Lean error: line 8 of your proof, column 4: maximum recursion depth has  | line 8 of your proof, column 4: maximum recursion depth has been reached |
| omni_theorem_388 | model | a Mathlib name that does not exist (an older or invented name) | line 14 of your proof, column 14: maximum recursion depth has been reached |
| omni_theorem_388 | model | a Mathlib name that does not exist (an older or invented name) | line 3 of your proof, column 57: unsolved goals |
| omni_theorem_639 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_639 | benchmark | the model says the statement is false (and still tried) | line 3 of your proof, column 21: unsolved goals |
| omni_theorem_639 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_639 | model | tactics did not close the goal | line 3 of your proof, column 33: Tactic `decide` failed to reduce |
| quantitative_reasoning_zh_blue_396 | model | tactics did not close the goal | line 9 of your proof, column 88: unsolved goals |
| quantitative_reasoning_zh_blue_396 | model | a Mathlib name that does not exist (an older or invented name) | line 16 of your proof, column 10: Type mismatch: After simplification, term |
| quantitative_reasoning_zh_blue_396 | model | tactics did not close the goal | line 5 of your proof, column 19: synthetic hole has already been defined and assigned to v |
| quantitative_reasoning_zh_blue_396 | model | tactics did not close the goal | line 22 of your proof, column 8: Type mismatch: After simplification, term |
| u-math_389 | model | a Mathlib name that does not exist (an older or invented name) | line 6 of your proof, column 6: Unknown identifier `tendsto_sin_div_self_nhds_0` |
| u-math_389 | model | a Mathlib name that does not exist (an older or invented name) | line 7 of your proof, column 7: Unknown constant `Real.tendsto_sin_div_self_nhds_0.comp` |
| u-math_389 | model | a Mathlib name that does not exist (an older or invented name) | line 19 of your proof, column 23: failed to synthesize instance of type class |
| u-math_389 | model | a Mathlib name that does not exist (an older or invented name) | line 6 of your proof, column 7: Unknown identifier `tendsto_sin_div_self.comp` |
| omni_theorem_3016 | model | tactics did not close the goal | line 11 of your proof, column 16: failed to synthesize instance of type class |
| omni_theorem_3016 | model | a Mathlib name that does not exist (an older or invented name) | line 15 of your proof, column 19: failed to synthesize instance of type class |
| omni_theorem_3016 | model | a Mathlib name that does not exist (an older or invented name) | line 13 of your proof, column 10: failed to synthesize instance of type class |
| omni_theorem_3016 | model | a Mathlib name that does not exist (an older or invented name) | line 5 of your proof, column 12: Unknown identifier `finite_Icc` |
| omni_theorem_534 | model | other Lean error: line 1 of your proof, column 2: maximum recursion depth has  | line 1 of your proof, column 2: maximum recursion depth has been reached |
| omni_theorem_534 | model | other Lean error: line 3 of your proof, column 2: maximum recursion depth has  | line 3 of your proof, column 2: maximum recursion depth has been reached |
| u-math_483 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| u-math_483 | benchmark | the model says the statement is false (and still tried) | your proof as a whole: unsolved goals |
| omni_theorem_534 | model | a Mathlib name that does not exist (an older or invented name) | line 34 of your proof, column 29: Unknown constant `Nat.lt_of_length_lt_pow` |
| u-math_483 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| u-math_483 | benchmark | the model says the statement is false (and still tried) | line 11 of your proof, column 23: Tactic `decide` proved that the proposition |
| u-math_234 | model | refused by the screen: `sorry` and `admit` are not allowed | `sorry` and `admit` are not allowed |
| u-math_234 | model | Lean syntax error | line 5 of your proof, column 4: Tactic `assumption` failed |
| u-math_234 | model | other Lean error: line 2 of your proof, column 28: Tactic `decide` proved that | line 2 of your proof, column 28: Tactic `decide` proved that the proposition |
| u-math_234 | model | a Mathlib name that does not exist (an older or invented name) | line 3 of your proof, column 5: Unknown constant `intervalIntegral.integral_sqrt_one_add_d |
| omni_theorem_933 | model | other Lean error: line 3 of your proof, column 2: Expected type must not conta | line 3 of your proof, column 2: Expected type must not contain free variables |
| omni_theorem_534 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_933 | model | tactics did not close the goal | line 5 of your proof, column 6: Tactic `decide` failed to reduce |
| omni_theorem_933 | model | tactics did not close the goal | line 5 of your proof, column 6: Tactic `decide` failed to reduce |
| quantitative_reasoning_zh_blue_880 | model | tactics did not close the goal | line 14 of your proof, column 8: linarith failed to find a contradiction |
| quantitative_reasoning_zh_blue_880 | model | tactics did not close the goal | line 25 of your proof, column 8: linarith failed to find a contradiction |
| omni_theorem_933 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_2364 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| quantitative_reasoning_zh_blue_880 | model | tactics did not close the goal | line 20 of your proof, column 12: linarith failed to find a contradiction |
| quantitative_reasoning_zh_blue_880 | model | tactics did not close the goal | line 26 of your proof, column 6: `polyrith` is no longer available, as the external servic |
| omni_theorem_2364 | model | tactics did not close the goal | line 28 of your proof, column 12: `ring_nf` made no progress on the goal |
| omni_theorem_2364 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| u-math_1027 | model | tactics did not close the goal | line 27 of your proof, column 4: Tactic `assumption` failed |
| omni_theorem_2364 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| u-math_408 | model | a Mathlib name that does not exist (an older or invented name) | line 14 of your proof, column 8: Type mismatch: After simplification, term |
| u-math_408 | model | a Mathlib name that does not exist (an older or invented name) | line 10 of your proof, column 4: Type mismatch: After simplification, term |
| u-math_408 | model | a Mathlib name that does not exist (an older or invented name) | line 15 of your proof, column 43: Application type mismatch: The argument |
| u-math_219 | model | tactics did not close the goal | line 7 of your proof, column 40: unsolved goals |
| u-math_408 | model | a Mathlib name that does not exist (an older or invented name) | line 104 of your proof, column 45: unexpected token ')'; expected ']' |
| u-math_1091 | model | tactics did not close the goal | your proof as a whole: unsolved goals |
| u-math_1091 | model | tactics did not close the goal | your proof as a whole: unsolved goals |
| u-math_1091 | model | tactics did not close the goal | your proof as a whole: unsolved goals |
| omni_theorem_629 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_629 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| u-math_1091 | model | tactics did not close the goal | line 20 of your proof, column 29: unsolved goals |
| omni_theorem_629 | benchmark | the model says the statement is false (and still tried) | line 1 of your proof, column 5: unknown tactic |
| omni_theorem_915 | model | tactics did not close the goal | line 3 of your proof, column 2: Tactic `decide` failed to reduce |
| omni_theorem_629 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_915 | model | a Mathlib name that does not exist (an older or invented name) | line 4 of your proof, column 6: failed to synthesize instance of type class |
| omni_theorem_915 | model | a Mathlib name that does not exist (an older or invented name) | line 4 of your proof, column 6: failed to synthesize instance of type class |
| omni_theorem_915 | model | tactics did not close the goal | line 2 of your proof, column 2: Tactic `decide` failed to reduce |
| quantitative_reasoning_zh_blue_68 | model | tactics did not close the goal | line 3 of your proof, column 12: Tactic `decide` failed to reduce |
| quantitative_reasoning_zh_blue_68 | model | Lean syntax error | line 3 of your proof, column 46: Application type mismatch: The argument |
| quantitative_reasoning_zh_blue_68 | model | Lean syntax error | line 2 of your proof, column 41: Application type mismatch: The argument |
| quantitative_reasoning_zh_blue_68 | benchmark | the model says the statement is false (and still tried) | your proof as a whole: unsolved goals |
| omni_theorem_3453 | model | Lean syntax error | line 10 of your proof, column 4: Type mismatch: After simplification, term |
| omni_theorem_3453 | model | Lean syntax error | line 11 of your proof, column 4: Type mismatch: After simplification, term |
| quantitative_reasoning_zh_blue_37 | model | a Mathlib name that does not exist (an older or invented name) | line 9 of your proof, column 7: Unknown constant `Set.finite_subsets` |
| quantitative_reasoning_zh_blue_37 | model | tactics did not close the goal | line 20 of your proof, column 23: Application type mismatch: The argument |
| quantitative_reasoning_zh_blue_37 | model | a Mathlib name that does not exist (an older or invented name) | line 21 of your proof, column 14: Function expected at |
| quantitative_reasoning_zh_blue_37 | model | a Mathlib name that does not exist (an older or invented name) | line 5 of your proof, column 5: failed to synthesize instance of type class |
| aime_all_2007_I_2 | model | Lean syntax error | line 7 of your proof, column 6: Type mismatch: After simplification, term |
| aime_all_2007_I_2 | model | Lean syntax error | line 5 of your proof, column 6: Type mismatch: After simplification, term |
| aime_all_2007_I_2 | model | Lean syntax error | line 6 of your proof, column 6: Type mismatch: After simplification, term |
| theorem_proving_zh_blue_1134 | model | a Mathlib name that does not exist (an older or invented name) | line 3 of your proof, column 14: Unknown identifier `loomisWhitney` |
| theorem_proving_zh_blue_1134 | model | a Mathlib name that does not exist (an older or invented name) | line 2 of your proof, column 14: Unknown identifier `lw_inequality` |
| theorem_proving_zh_blue_1134 | model | a Mathlib name that does not exist (an older or invented name) | line 1 of your proof, column 14: Unknown constant `Set.latticeLoomisWhitney` |
| aime_all_2007_I_2 | model | tactics did not close the goal | line 35 of your proof, column 12: expected token |
| theorem_proving_zh_blue_1134 | model | a Mathlib name that does not exist (an older or invented name) | line 3 of your proof, column 5: Unknown constant `Set.ncard_sq_le_mul_ncard_image_fst_mul_ |
| omni_theorem_2243 | model | tactics did not close the goal | line 8 of your proof, column 24: linarith failed to find a contradiction |
| omni_theorem_2243 | model | tactics did not close the goal | line 15 of your proof, column 23: linarith failed to find a contradiction |
| omni_theorem_2243 | model | tactics did not close the goal | line 7 of your proof, column 6: Type mismatch: After simplification, term |
| aime_all_2018_I_11 | model | no proof in the reply | no ```lean block with a proof of this theorem |
| omni_theorem_2243 | model | a Mathlib name that does not exist (an older or invented name) | line 7 of your proof, column 43: Unknown identifier `sub_eq` |
| aime_all_2018_I_11 | model | other Lean error: line 1 of your proof, column 2: maximum recursion depth has  | line 1 of your proof, column 2: maximum recursion depth has been reached |
| aime_all_2018_I_11 | model | proof too heavy: Lean's own work limit | line 3 of your proof, column 44: unsolved goals |
| aime_all_2018_I_11 | model | other Lean error: line 3 of your proof, column 4: maximum recursion depth has  | line 3 of your proof, column 4: maximum recursion depth has been reached |
| aime_all_2015_II_3 | model | tactics did not close the goal | line 2 of your proof, column 29: unexpected identifier; expected 'in' |
| aime_all_2015_II_3 | model | Lean syntax error | line 17 of your proof, column 10: Invalid projection: Projections cannot be used on functi |
| aime_all_2015_II_3 | model | tactics did not close the goal | line 17 of your proof, column 36: unexpected identifier; expected ',' |
| omni_theorem_1308 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_1308 | model | tactics did not close the goal | line 2 of your proof, column 2: Tactic `decide` failed to reduce |
| omni_theorem_1308 | model | tactics did not close the goal | line 4 of your proof, column 94: unsolved goals |
| omni_theorem_1308 | model | tactics did not close the goal | line 2 of your proof, column 2: Tactic `decide` failed to reduce |
| omni_theorem_4271 | model | tactics did not close the goal | line 3 of your proof, column 2: failed to synthesize |
| omni_theorem_4271 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_4271 | benchmark | the model says the statement is false | no ```lean block with a proof of this theorem |
| omni_theorem_4271 | model | a Mathlib name that does not exist (an older or invented name) | line 72 of your proof, column 65: unexpected token '·'; expected ',' |

Sorted from each attempt's transcript by fixed rules (src/bench/audit.ts); read the transcripts for the harness and benchmark rows.
