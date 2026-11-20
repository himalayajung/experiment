import Problems.BigDefs
import Problems.Targets

/-!
# OSO bigger problem set: posted targets

Public to every agent in a run on the bigger set. The 8 targets of the main set (Problems.Targets) are
kept as they are; these 19 are added. Depths are measured from the hidden reference proofs
(reference-dag-big.md); the bounty is 4 · 2^(depth − 1).
-/

namespace OSO
open M2

/-- **A6** · area A: every `L p q` has `L m ∣ L (m k)`. -/
def target_A6 : Prop := ∀ p q m k : Nat, L p q m ∣ L p q (m * k)

/-- **A7** · area A: strong divisibility for every `L p q` with `gcd p q = 1`. -/
def target_A7 : Prop := ∀ p q m n : Nat, Nat.gcd p q = 1 → Nat.gcd (L p q m) (L p q n) = L p q (Nat.gcd m n)

/-- **F2** · area A: `v m ∣ v (m k)`. -/
def target_F2 : Prop := ∀ m k : Nat, v m ∣ v (m * k)

/-- **F3** · area A: strong divisibility for `v`. -/
def target_F3 : Prop := ∀ m n : Nat, Nat.gcd (v m) (v n) = v (Nat.gcd m n)

/-- **C5** · area C: the determinant of a power. -/
def target_C5 : Prop := ∀ (x : M2) (n : Nat), det (pow x n) = det x ^ n

/-- **C6** · areas A + C: the powers of the companion matrix. -/
def target_C6 : Prop := ∀ p q n : Nat,
  pow (comp p q) (n + 1) = ⟨L p q (n + 2), q * L p q (n + 1), L p q (n + 1), q * L p q n⟩

/-- **X3** · areas A + C: the determinant of the companion matrix's powers. -/
def target_X3 : Prop := ∀ p q n : Nat, det (pow (comp p q) n) = (-(q : Int)) ^ n

/-- **X6** · areas A + C: Cassini's identity for every `L p q` with `q > 0`. -/
def target_X6 : Prop := ∀ p q n : Nat, 0 < q →
  (L p q (n + 1) : Int) ^ 2 - L p q (n + 2) * L p q n = (-(q : Int)) ^ n

/-- **D1** · area D: insertion keeps a search tree a search tree. -/
def target_D1 : Prop := ∀ (x : Nat) (t : Tree), t.Search → (t.insert x).Search

/-- **D2** · area D: the in-order list of a search tree is sorted. -/
def target_D2 : Prop := ∀ t : Tree, t.Search → Sorted t.inorder

/-- **D3** · areas D + B: tree sort is insertion sort. -/
def target_D3 : Prop := ∀ l : List Nat, tsort l = isort l

/-- **E1** · area E: reversing keeps the counts. -/
def target_E1 : Prop := ∀ l : List Nat, SameCounts l.reverse l

/-- **E2** · areas E + B: merge sort keeps the counts. -/
def target_E2 : Prop := ∀ l : List Nat, SameCounts (msort l) l

/-- **E3** · areas E + B: insertion sort keeps the sum. -/
def target_E3 : Prop := ∀ l : List Nat, lsum (isort l) = lsum l

/-- **E4** · areas E + B: insertion sort gives the same list exactly when the counts match. -/
def target_E4 : Prop := ∀ l l' : List Nat, isort l = isort l' ↔ SameCounts l l'

/-- **E5** · areas E + B: merge sort keeps the sum. -/
def target_E5 : Prop := ∀ l : List Nat, lsum (msort l) = lsum l

/-- **X7** · areas A + B: sorting the first `n` terms of `L p q` changes nothing, for `p ≥ 1`. -/
def target_X7 : Prop := ∀ p q n : Nat, 1 ≤ p → isort (firstN (L p q) n) = firstN (L p q) n

/-- **X4** · areas A + D: tree-sorting the first `n` terms of `L p q` changes nothing, for `p ≥ 1`. -/
def target_X4 : Prop := ∀ p q n : Nat, 1 ≤ p → tsort (firstN (L p q) n) = firstN (L p q) n

/-- **X5** · areas A + E: a list with the same counts as the first `n` terms of `L p q` sorts to them, for `p ≥ 1`. -/
def target_X5 : Prop := ∀ (p q n : Nat) (l : List Nat), 1 ≤ p → SameCounts l (firstN (L p q) n) →
  isort l = firstN (L p q) n

end OSO
