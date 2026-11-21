import Reference.Check
import Reference.BigAC
import Reference.BigDE
import Problems.BigTargets

/-! Every posted target of the bigger set is proved by the reference proofs. -/

namespace OSO
open M2

-- B3 is checked on one theorem here (main set: the pair isort_sorted, cnt_isort).
theorem check_B3_full : target_B3 := isort_correct
theorem check_A6 : target_A6 := L_dvd_mul
theorem check_A7 : target_A7 := fun p q m n h => L_gcd p q h m n
theorem check_F2 : target_F2 := v_dvd_mul
theorem check_F3 : target_F3 := v_gcd
theorem check_C5 : target_C5 := det_pow
theorem check_C6 : target_C6 := comp_pow
theorem check_X3 : target_X3 := det_comp_pow
theorem check_X6 : target_X6 := fun p q n h => cassini_L p q h n
theorem check_D1 : target_D1 := search_insert
theorem check_D2 : target_D2 := inorder_sorted
theorem check_D3 : target_D3 := tsort_eq_isort
theorem check_E1 : target_E1 := same_reverse
theorem check_E2 : target_E2 := same_msort
theorem check_E3 : target_E3 := lsum_isort
theorem check_E4 : target_E4 := isort_eq_iff
theorem check_E5 : target_E5 := lsum_msort
theorem check_X7 : target_X7 := fun p q n h => isort_firstN p q h n
theorem check_X4 : target_X4 := fun p q n h => tsort_firstN p q h n
theorem check_X5 : target_X5 := fun p q n l h => isort_same_firstN p q h n l

end OSO
