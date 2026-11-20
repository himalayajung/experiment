import Reference.BigA
import Reference.B

/-!
# Reference proofs, bigger set, areas D (search trees) and E (counting), and their cross targets

Hidden from agents. Hub H1 is `sorted_unique` (area B), H4 is `inorder_insert`, H5 is `lsum_same`.
-/

namespace OSO

open Tree

theorem all_insert (P : Nat → Prop) (x : Nat) (hx : P x) : ∀ t, All P t → All P (Tree.insert x t)
  | leaf, _ => ⟨trivial, hx, trivial⟩
  | node l y r, ⟨hl, hy, hr⟩ => by
    unfold Tree.insert
    split
    · exact ⟨all_insert P x hx l hl, hy, hr⟩
    · exact ⟨hl, hy, all_insert P x hx r hr⟩

/-- Posted D1: insertion keeps a search tree a search tree. -/
theorem search_insert (x : Nat) : ∀ t, Search t → Search (Tree.insert x t)
  | leaf, _ => ⟨trivial, trivial, trivial, trivial⟩
  | node l y r, ⟨hl, hr, hal, har⟩ => by
    unfold Tree.insert
    split
    · exact ⟨search_insert x l hl, hr, all_insert _ x (by assumption) l hal, har⟩
    · exact ⟨hl, search_insert x r hr, hal, all_insert _ x (by omega) r har⟩

theorem all_iff_mem (P : Nat → Prop) : ∀ t, All P t ↔ ∀ z ∈ inorder t, P z
  | leaf => by simp [All, inorder]
  | node l y r => by
    simp only [All, inorder, List.mem_append, List.mem_cons, all_iff_mem P l, all_iff_mem P r]
    constructor
    · rintro ⟨hl, hy, hr⟩ z (hz | rfl | hz)
      · exact hl z hz
      · exact hy
      · exact hr z hz
    · intro h
      exact ⟨fun z hz => h z (Or.inl hz), h y (Or.inr (Or.inl rfl)), fun z hz => h z (Or.inr (Or.inr hz))⟩

theorem inorder_pairwise : ∀ t, Search t → (inorder t).Pairwise (· ≤ ·)
  | leaf, _ => List.Pairwise.nil
  | node l y r, ⟨hl, hr, hal, har⟩ => by
    have al := (all_iff_mem _ l).mp hal
    have ar := (all_iff_mem _ r).mp har
    simp only [inorder]
    rw [List.pairwise_append, List.pairwise_cons]
    refine ⟨inorder_pairwise l hl, ⟨fun z hz => Nat.le_of_lt (ar z hz), inorder_pairwise r hr⟩, ?_⟩
    intro a ha b hb
    rcases List.mem_cons.mp hb with rfl | hb
    · exact al a ha
    · exact Nat.le_trans (al a ha) (Nat.le_of_lt (ar b hb))

/-- Posted D2: the in-order list of a search tree is sorted. -/
theorem inorder_sorted (t : Tree) (h : Search t) : Sorted (inorder t) :=
  (sorted_iff_pairwise _).mpr (inorder_pairwise t h)

theorem cnt_inorder_insert (a x : Nat) : ∀ t, cnt a (inorder (Tree.insert x t)) = cnt a (x :: inorder t)
  | leaf => rfl
  | node l y r => by
    unfold Tree.insert
    split
    · simp only [inorder, cnt_append, cnt_inorder_insert a x l, cnt]; omega
    · simp only [inorder, cnt_append, cnt_inorder_insert a x r, cnt]; omega

/-- Hub H4: inserting into a search tree matches inserting into its sorted list. -/
theorem inorder_insert (x : Nat) (t : Tree) (h : Search t) : inorder (Tree.insert x t) = ins x (inorder t) :=
  sorted_unique _ _ (inorder_sorted _ (search_insert x t h)) (ins_sorted x _ (inorder_sorted t h))
    (fun a => by rw [cnt_inorder_insert, cnt_ins])

theorem search_ofList : ∀ l, Search (ofList l)
  | [] => trivial
  | x :: xs => search_insert x _ (search_ofList xs)

/-- Posted D3: tree sort is insertion sort. -/
theorem tsort_eq_isort : ∀ l, tsort l = isort l
  | [] => rfl
  | x :: xs => by
    show inorder (Tree.insert x (ofList xs)) = ins x (isort xs)
    rw [inorder_insert x _ (search_ofList xs)]
    exact congrArg (ins x) (tsort_eq_isort xs)

/-! ## E. Counting -/

theorem cnt_reverse (a : Nat) : ∀ l, cnt a l.reverse = cnt a l
  | [] => rfl
  | x :: xs => by rw [List.reverse_cons, cnt_append, cnt_reverse a xs]; simp [cnt]; omega

/-- Posted E1: reversing keeps the counts. -/
theorem same_reverse (l : List Nat) : SameCounts l.reverse l := fun a => cnt_reverse a l

/-- Posted E2: merge sort keeps the counts. -/
theorem same_msort (l : List Nat) : SameCounts (msort l) l := (msort_pairwise l).2

/-- Posted E4: insertion sort gives the same list exactly when the counts match. -/
theorem isort_eq_iff (l l' : List Nat) : isort l = isort l' ↔ SameCounts l l' := by
  constructor
  · intro h a; rw [← cnt_isort a l, h, cnt_isort]
  · intro h
    exact sorted_unique _ _ (isort_sorted l) (isort_sorted l')
      (fun a => by rw [cnt_isort, cnt_isort, h a])

theorem lsum_ins (x : Nat) : ∀ l, lsum (ins x l) = x + lsum l
  | [] => rfl
  | y :: ys => by
    unfold ins
    split
    · rfl
    · simp only [lsum, lsum_ins x ys]; omega

/-- Posted E3: insertion sort keeps the sum. -/
theorem lsum_isort : ∀ l, lsum (isort l) = lsum l
  | [] => rfl
  | x :: xs => by simp only [isort, lsum_ins, lsum, lsum_isort xs]

/-- Hub H5: lists with the same counts have the same sum. -/
theorem lsum_same (l l' : List Nat) (h : SameCounts l l') : lsum l = lsum l' := by
  rw [← lsum_isort l, ← lsum_isort l', (isort_eq_iff l l').mpr h]

/-- Posted E5: merge sort keeps the sum. -/
theorem lsum_msort (l : List Nat) : lsum (msort l) = lsum l := lsum_same _ _ (same_msort l)

/-! ## Cross targets: sequences and sorting -/

theorem L_mono (p q : Nat) (hp : 1 ≤ p) {i j : Nat} (h : i ≤ j) : L p q i ≤ L p q j := by
  induction h with
  | refl => exact Nat.le_refl _
  | step _ ih => exact Nat.le_trans ih (L_le_succ p q hp _)

theorem firstN_pairwise (p q : Nat) (hp : 1 ≤ p) (n : Nat) : (firstN (L p q) n).Pairwise (· ≤ ·) := by
  unfold firstN
  rw [List.pairwise_map]
  exact List.pairwise_lt_range.imp (fun h => L_mono p q hp (Nat.le_of_lt h))

/-- Posted X2 (general): sorting the first `n` terms changes nothing, for `p ≥ 1`. -/
theorem isort_firstN (p q : Nat) (hp : 1 ≤ p) (n : Nat) : isort (firstN (L p q) n) = firstN (L p q) n :=
  pairwise_unique _ _ ((sorted_iff_pairwise _).mp (isort_sorted _)) (firstN_pairwise p q hp n)
    (fun a => cnt_isort a _)

/-- Posted X4: tree-sorting the first `n` terms changes nothing, for `p ≥ 1`. -/
theorem tsort_firstN (p q : Nat) (hp : 1 ≤ p) (n : Nat) : tsort (firstN (L p q) n) = firstN (L p q) n := by
  rw [tsort_eq_isort, isort_firstN p q hp]

/-- Posted X5: any list with the same counts as the first `n` terms sorts to them, for `p ≥ 1`. -/
theorem isort_same_firstN (p q : Nat) (hp : 1 ≤ p) (n : Nat) (l : List Nat)
    (h : SameCounts l (firstN (L p q) n)) : isort l = firstN (L p q) n := by
  rw [(isort_eq_iff l _).mpr h, isort_firstN p q hp]

end OSO
