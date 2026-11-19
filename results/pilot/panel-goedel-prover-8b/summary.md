# Lean pilot: panel-goedel-prover-8b

How hard each theorem of the Lean problem set is for a real agent. 

- **Agent:** `hf.co/mradermacher/Goedel-Prover-V2-8B-GGUF:Q4_K_M` via local, reasoning effort high. One attempt is a first proof plus up to 3 repairs on Lean's error messages.
- **Rules:** Lean 4.35 core only; `grind` banned; the checker accepts a proof only if it uses nothing beyond the library given and Lean's standard axioms.
- **Conditions:** *library*: the theorems it rests on in the reference tree are given; *alone*: posted targets with an empty library.
- **Attempts:** 32; tokens in 847.4k (plus 0.0k cached), out 618.8k.

Theorem ids are the anonymous ids of [worlds/lean-reference.json](../../../worlds/lean-reference.json); statements and proofs are in lean/Reference/.

## Success by level (library)

| depth | theorems | attempts | proved | success per attempt | tokens per attempt |
| --- | --- | --- | --- | --- | --- |
| 1 | 1 | 2 | 0 | 0% | 44.8k |
| 2 | 1 | 2 | 0 | 0% | 65.9k |
| 3 | 2 | 4 | 0 | 0% | 30.3k |
| 4 | 1 | 2 | 0 | 0% | 17.0k |
| 5 | 2 | 4 | 0 | 0% | 45.9k |
| 7 | 1 | 2 | 0 | 0% | 29.0k |

## Do targets need their lemmas?

| target | depth | alone | with library |
| --- | --- | --- | --- |
| C3 | 1 | 0/2 | 0/2 |
| A3 | 2 | 0/2 | 0/2 |
| C4 | 3 | 0/2 | 0/2 |
| X1 | 3 | 0/2 | 0/2 |
| B3 | 4 | 0/2 | 0/2 |
| B5 | 5 | 0/2 | 0/2 |
| X2 | 5 | 0/2 | 0/2 |
| A5 | 7 | 0/2 | 0/2 |

A target proved alone in most attempts is too easy: its lemmas are not needed.

## Every theorem

| id | depth | area | condition | proved | mean turns | tokens per attempt |
| --- | --- | --- | --- | --- | --- | --- |
| C3 | 1 | C | alone | 0/2 | 4.0 | 58.5k |
| A3 | 2 | A | alone | 0/2 | 4.0 | 70.1k |
| C4 | 3 | C | alone | 0/2 | 4.0 | 49.0k |
| X1 | 3 | cross | alone | 0/2 | 4.0 | 40.1k |
| B3 | 4 | B | alone | 0/2 | 4.0 | 37.8k |
| B5 | 5 | B | alone | 0/2 | 4.0 | 58.2k |
| X2 | 5 | cross | alone | 0/2 | 4.0 | 32.1k |
| A5 | 7 | A | alone | 0/2 | 4.0 | 78.3k |
| C3 | 1 | C | library | 0/2 | 4.0 | 44.8k |
| A3 | 2 | A | library | 0/2 | 4.0 | 65.9k |
| C4 | 3 | C | library | 0/2 | 4.0 | 16.4k |
| X1 | 3 | cross | library | 0/2 | 4.0 | 44.2k |
| B3 | 4 | B | library | 0/2 | 4.0 | 17.0k |
| B5 | 5 | B | library | 0/2 | 4.0 | 62.8k |
| X2 | 5 | cross | library | 0/2 | 4.0 | 29.1k |
| A5 | 7 | A | library | 0/2 | 4.0 | 29.0k |
