import Problems.Defs

/-!
# OSO bigger problem set: definitions added to the main set

Public to every agent in a run on the bigger set, together with `Problems.Defs`. Three new areas, and
area A widened from one sequence to a family:

* **A. Two-term sequences:** `L p q 0 = 0`, `L p q 1 = 1`, `L p q (n + 2) = p * L p q (n + 1) + q * L p q n`
  (`u` is `L 5 3`; `v` is `L 1 2`).
* **D. Search trees:** binary trees of numbers, insertion, the in-order list, tree sort.
* **E. Counting:** two lists with the same count of every number, and the sum of a list.
-/

namespace OSO

/-! ## A. Two-term sequences -/

def L (p q : Nat) : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => p * L p q (n + 1) + q * L p q n

/-- `0, 1, 1, 3, 5, 11, 21, …` -/
def v : Nat → Nat := L 1 2

/-- The matrix that generates `L p q`. -/
def comp (p q : Nat) : M2 := ⟨p, q, 1, 0⟩

/-- The first `n` terms of a sequence: `[f 0, …, f (n - 1)]`. -/
def firstN (f : Nat → Nat) (n : Nat) : List Nat := (List.range n).map f

/-! ## D. Search trees -/

inductive Tree where
  | leaf : Tree
  | node : Tree → Nat → Tree → Tree

namespace Tree

/-- Insert into a search tree: smaller or equal to the left, larger to the right. -/
def insert (x : Nat) : Tree → Tree
  | leaf => node leaf x leaf
  | node l y r => if x ≤ y then node (insert x l) y r else node l y (insert x r)

/-- The numbers of a tree, left to right. -/
def inorder : Tree → List Nat
  | leaf => []
  | node l y r => inorder l ++ y :: inorder r

/-- Every number in the tree satisfies `P`. -/
def All (P : Nat → Prop) : Tree → Prop
  | leaf => True
  | node l y r => All P l ∧ P y ∧ All P r

/-- A search tree: everything on the left is at most the root, everything on the right is larger. -/
def Search : Tree → Prop
  | leaf => True
  | node l y r => Search l ∧ Search r ∧ All (· ≤ y) l ∧ All (y < ·) r

/-- The tree made by inserting the numbers of a list, last first. -/
def ofList : List Nat → Tree
  | [] => leaf
  | x :: xs => insert x (ofList xs)

end Tree

/-- Tree sort: build a search tree, read it in order. -/
def tsort (l : List Nat) : List Nat := (Tree.ofList l).inorder

/-! ## E. Counting -/

/-- Every number appears equally often in both lists. -/
def SameCounts (l l' : List Nat) : Prop := ∀ a, cnt a l = cnt a l'

def lsum : List Nat → Nat
  | [] => 0
  | x :: xs => x + lsum xs

end OSO
