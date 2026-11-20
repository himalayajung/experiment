import Problems.BigDefs

/-!
# Reference proofs, bigger set, area A: two-term sequences `L p q`

Hidden from agents. Hub H2 is `L_add`.
-/

namespace OSO

theorem L_succ_succ (p q n : Nat) : L p q (n + 2) = p * L p q (n + 1) + q * L p q n := rfl

theorem L_one (p q : Nat) : L p q 1 = 1 := rfl

theorem u_eq_L : ∀ n, u n = L 5 3 n
  | 0 => rfl
  | 1 => rfl
  | n + 2 => by rw [show u (n + 2) = 5 * u (n + 1) + 3 * u n from rfl, L_succ_succ, u_eq_L (n + 1), u_eq_L n]

theorem v_eq_L (n : Nat) : v n = L 1 2 n := rfl

/-- Hub H2: the addition formula. -/
theorem L_add (p q : Nat) : ∀ m n, L p q (m + n + 1) = L p q (m + 1) * L p q (n + 1) + q * L p q m * L p q n
  | 0, n => by simp [L]
  | 1, n => by
    rw [show 1 + n + 1 = n + 2 by omega, L_succ_succ]
    simp [L]
  | m + 2, n => by
    have h1 := L_add p q (m + 1) n
    have h0 := L_add p q m n
    rw [show m + 2 + n + 1 = (m + n + 1) + 2 by omega, L_succ_succ,
      show m + n + 1 + 1 = m + 1 + n + 1 by omega, h1, h0,
      show m + 2 + 1 = (m + 1) + 2 by omega, L_succ_succ p q (m + 1), L_succ_succ p q m]
    grind

/-- Posted A3 (general): `L m` divides `L (m k)`. -/
theorem L_dvd_mul (p q m : Nat) : ∀ k, L p q m ∣ L p q (m * k)
  | 0 => by simp [L]
  | k + 1 => by
    cases m with
    | zero => simp [L]
    | succ m' =>
      have ih := L_dvd_mul p q (m' + 1) k
      rw [show (m' + 1) * (k + 1) = (m' + 1) * k + m' + 1 by rw [Nat.mul_succ]; omega, L_add]
      exact Nat.dvd_add (Nat.dvd_mul_left _ _)
        (Nat.dvd_mul_right_of_dvd (Nat.dvd_mul_left_of_dvd ih q) _)

/-- Posted F2: `v m` divides `v (m k)`. -/
theorem v_dvd_mul (m k : Nat) : v m ∣ v (m * k) := L_dvd_mul 1 2 m k

/-- With `gcd p q = 1`, `q` shares no factor with any term after the first. -/
theorem coprime_q_L (p q : Nat) (hpq : Nat.Coprime p q) : ∀ n, Nat.Coprime q (L p q (n + 1))
  | 0 => by simp [Nat.Coprime, L]
  | n + 1 => by
    have ih := coprime_q_L p q hpq n
    show Nat.gcd q (L p q (n + 2)) = 1
    rw [L_succ_succ, show p * L p q (n + 1) + q * L p q n = p * L p q (n + 1) + q * L p q n from rfl,
      Nat.gcd_comm, show p * L p q (n + 1) + q * L p q n = p * L p q (n + 1) + L p q n * q by rw [Nat.mul_comm q],
      Nat.gcd_add_mul_right_left, Nat.gcd_comm]
    exact Nat.Coprime.mul_right (Nat.Coprime.symm hpq) ih

theorem L_coprime_succ (p q : Nat) (hpq : Nat.Coprime p q) : ∀ n, Nat.Coprime (L p q n) (L p q (n + 1))
  | 0 => by simp [Nat.Coprime, L]
  | n + 1 => by
    have ih := L_coprime_succ p q hpq n
    show Nat.gcd (L p q (n + 1)) (L p q (n + 2)) = 1
    rw [L_succ_succ, show p * L p q (n + 1) + q * L p q n = q * L p q n + L p q (n + 1) * p by grind,
      Nat.gcd_add_mul_left_right, Nat.gcd_comm,
      Nat.Coprime.gcd_mul_left_cancel _ (coprime_q_L p q hpq n)]
    exact ih

theorem L_gcd_add (p q : Nat) (hpq : Nat.Coprime p q) (m n : Nat) (hn : 0 < n) :
    Nat.gcd (L p q (m + n)) (L p q n) = Nat.gcd (L p q m) (L p q n) := by
  obtain ⟨n', rfl⟩ : ∃ n', n = n' + 1 := ⟨n - 1, by omega⟩
  rw [show m + (n' + 1) = m + n' + 1 by omega, L_add, Nat.gcd_comm,
    show L p q (m + 1) * L p q (n' + 1) + q * L p q m * L p q n' = q * L p q m * L p q n' + L p q (n' + 1) * L p q (m + 1) by grind,
    Nat.gcd_add_mul_left_right, Nat.gcd_comm,
    Nat.Coprime.gcd_mul_right_cancel _ (L_coprime_succ p q hpq n'),
    Nat.Coprime.gcd_mul_left_cancel _ (coprime_q_L p q hpq n')]

theorem L_gcd_add_mul (p q : Nat) (hpq : Nat.Coprime p q) (m r : Nat) (hm : 0 < m) :
    ∀ k, Nat.gcd (L p q (r + m * k)) (L p q m) = Nat.gcd (L p q r) (L p q m)
  | 0 => by simp
  | k + 1 => by
    rw [show r + m * (k + 1) = (r + m * k) + m by rw [Nat.mul_succ]; omega, L_gcd_add p q hpq _ _ hm]
    exact L_gcd_add_mul p q hpq m r hm k

/-- Posted A5 (general): strong divisibility when `gcd p q = 1`. -/
theorem L_gcd (p q : Nat) (hpq : Nat.Coprime p q) (m n : Nat) :
    Nat.gcd (L p q m) (L p q n) = L p q (Nat.gcd m n) := by
  induction m, n using Nat.gcd.induction with
  | H0 n => simp [L]
  | H1 m n hm ih =>
    have key : Nat.gcd (L p q n) (L p q m) = Nat.gcd (L p q (n % m)) (L p q m) := by
      have := L_gcd_add_mul p q hpq m (n % m) hm (n / m)
      rwa [Nat.mod_add_div] at this
    calc Nat.gcd (L p q m) (L p q n) = Nat.gcd (L p q n) (L p q m) := Nat.gcd_comm _ _
      _ = Nat.gcd (L p q (n % m)) (L p q m) := key
      _ = L p q (Nat.gcd (n % m) m) := ih
      _ = L p q (Nat.gcd m n) := by rw [← Nat.gcd_rec]

/-- Posted F3: strong divisibility for `v`. -/
theorem v_gcd (m n : Nat) : Nat.gcd (v m) (v n) = v (Nat.gcd m n) := L_gcd 1 2 (by decide) m n

/-- Terms never decrease when `p ≥ 1`. -/
theorem L_le_succ (p q : Nat) (hp : 1 ≤ p) : ∀ n, L p q n ≤ L p q (n + 1)
  | 0 => by simp [L]
  | n + 1 => by
    rw [L_succ_succ]
    have : L p q (n + 1) ≤ p * L p q (n + 1) := Nat.le_mul_of_pos_left _ hp
    omega

end OSO
