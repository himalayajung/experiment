import Reference.BigA
import Reference.C

/-!
# Reference proofs, bigger set, areas A + C: the companion matrix

Hidden from agents.
-/

namespace OSO

open M2

/-- Posted C6: the powers of the companion matrix are made of the sequence. -/
theorem comp_pow (p q : Nat) : ∀ n,
    pow (comp p q) (n + 1) = ⟨L p q (n + 2), q * L p q (n + 1), L p q (n + 1), q * L p q n⟩
  | 0 => by simp [pow, comp, mul, one, L]
  | n + 1 => by
    rw [pow, comp_pow p q n]
    simp only [mul, comp, M2.mk.injEq]
    have e₁ : L p q (n + 1 + 2) = p * L p q (n + 1 + 1) + q * L p q (n + 1) := L_succ_succ p q (n + 1)
    have e₂ : L p q (n + 2) = p * L p q (n + 1) + q * L p q n := L_succ_succ p q n
    have e₃ : L p q (n + 1 + 1) = L p q (n + 2) := rfl
    refine ⟨?_, ?_, ?_, ?_⟩ <;> (try simp only [e₁, e₃, e₂]) <;> push_cast <;> grind

/-- Posted X3: the determinant of the companion matrix's `n`-th power. -/
theorem det_comp_pow (p q n : Nat) : det (pow (comp p q) n) = (-(q : Int)) ^ n := by
  rw [det_pow]; simp [det, comp]

/-- Posted X1 (general): Cassini's identity, for `q > 0`. -/
theorem cassini_L (p q : Nat) (hq : 0 < q) (n : Nat) :
    (L p q (n + 1) : Int) ^ 2 - L p q (n + 2) * L p q n = (-(q : Int)) ^ n := by
  have h := det_comp_pow p q (n + 1)
  rw [comp_pow p q n] at h
  simp only [det] at h
  rw [Int.pow_succ] at h
  push_cast at h
  have hq' : (q : Int) ≠ 0 := by omega
  have : (q : Int) * ((L p q (n + 1) : Int) ^ 2 - L p q (n + 2) * L p q n) = (q : Int) * (-(q : Int)) ^ n := by
    grind
  exact Int.eq_of_mul_eq_mul_left hq' this

end OSO
