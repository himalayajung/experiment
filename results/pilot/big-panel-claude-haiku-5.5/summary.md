# Lean pilot: big-panel-claude-haiku-5.5

How hard each theorem of the Lean problem set is for a real agent. 

- **Agent:** `anthropic/claude-haiku-5.5` via openrouter, reasoning effort high. One attempt is a first proof plus up to 3 repairs on Lean's error messages.
- **Rules:** Lean 4.35 core only; `grind` banned; the checker accepts a proof only if it uses nothing beyond the library given and Lean's standard axioms.
- **Conditions:** *library*: the theorems it rests on in the reference tree are given; *alone*: posted targets with an empty library.
- **Attempts:** 108; tokens in 2856.2k (plus 0.0k cached), out 1648.0k; cost $1.11 ($0.010 per attempt).

Theorem ids are the anonymous ids of [worlds/lean-reference.json](../../../worlds/lean-reference.json); statements and proofs are in lean/Reference/.

## Success by level (library)

| depth | theorems | attempts | proved | success per attempt | tokens per attempt |
| --- | --- | --- | --- | --- | --- |
| 1 | 2 | 4 | 4 | 100% | 25.3k |
| 2 | 5 | 10 | 10 | 100% | 11.7k |
| 3 | 6 | 12 | 12 | 100% | 17.0k |
| 4 | 3 | 6 | 6 | 100% | 14.7k |
| 5 | 6 | 12 | 12 | 100% | 8.4k |
| 6 | 3 | 6 | 6 | 100% | 5.4k |
| 7 | 2 | 4 | 4 | 100% | 8.3k |

## Do targets need their lemmas?

| target | depth | alone | with library |
| --- | --- | --- | --- |
| C3 | 1 | 2/2 | 2/2 |
| C6 | 1 | 2/2 | 2/2 |
| A3 | 2 | 2/2 | 2/2 |
| A6 | 2 | 2/2 | 2/2 |
| C5 | 2 | 2/2 | 2/2 |
| D1 | 2 | 2/2 | 2/2 |
| E3 | 2 | 2/2 | 2/2 |
| C4 | 3 | 2/2 | 2/2 |
| D2 | 3 | 2/2 | 2/2 |
| E1 | 3 | 2/2 | 2/2 |
| F2 | 3 | 2/2 | 2/2 |
| X1 | 3 | 2/2 | 2/2 |
| X3 | 3 | 2/2 | 2/2 |
| B3 | 4 | 2/2 | 2/2 |
| E2 | 4 | 2/2 | 2/2 |
| X6 | 4 | 2/2 | 2/2 |
| A7 | 5 | 1/2 | 2/2 |
| B5 | 5 | 1/2 | 2/2 |
| D3 | 5 | 2/2 | 2/2 |
| E4 | 5 | 2/2 | 2/2 |
| X2 | 5 | 2/2 | 2/2 |
| X7 | 5 | 2/2 | 2/2 |
| F3 | 6 | 2/2 | 2/2 |
| X4 | 6 | 2/2 | 2/2 |
| X5 | 6 | 2/2 | 2/2 |
| A5 | 7 | 0/2 | 2/2 |
| E5 | 7 | 2/2 | 2/2 |

A target proved alone in most attempts is too easy: its lemmas are not needed.

## Every theorem

| id | depth | area | condition | proved | mean turns | tokens per attempt |
| --- | --- | --- | --- | --- | --- | --- |
| C3 | 1 | C | alone | 2/2 | 1.5 | 10.9k |
| C6 | 1 | cross | alone | 2/2 | 2.0 | 43.6k |
| A3 | 2 | A | alone | 2/2 | 2.0 | 75.4k |
| A6 | 2 | A | alone | 2/2 | 1.0 | 26.4k |
| C5 | 2 | C | alone | 2/2 | 1.5 | 11.6k |
| D1 | 2 | D | alone | 2/2 | 1.5 | 12.0k |
| E3 | 2 | D | alone | 2/2 | 1.5 | 7.4k |
| C4 | 3 | C | alone | 2/2 | 1.0 | 10.2k |
| D2 | 3 | D | alone | 2/2 | 1.0 | 14.2k |
| E1 | 3 | D | alone | 2/2 | 1.0 | 5.7k |
| F2 | 3 | A | alone | 2/2 | 3.0 | 109.5k |
| X1 | 3 | cross | alone | 2/2 | 2.5 | 52.7k |
| X3 | 3 | cross | alone | 2/2 | 1.5 | 16.7k |
| B3 | 4 | B | alone | 2/2 | 1.5 | 22.7k |
| E2 | 4 | D | alone | 2/2 | 1.0 | 10.5k |
| X6 | 4 | cross | alone | 2/2 | 3.0 | 104.3k |
| A7 | 5 | A | alone | 1/2 | 4.0 | 249.0k |
| B5 | 5 | B | alone | 1/2 | 3.5 | 173.9k |
| D3 | 5 | D | alone | 2/2 | 2.0 | 62.2k |
| E4 | 5 | D | alone | 2/2 | 2.5 | 91.6k |
| X2 | 5 | cross | alone | 2/2 | 2.0 | 42.0k |
| X7 | 5 | D | alone | 2/2 | 2.5 | 56.8k |
| F3 | 6 | A | alone | 2/2 | 3.5 | 194.7k |
| X4 | 6 | D | alone | 2/2 | 2.5 | 84.0k |
| X5 | 6 | D | alone | 2/2 | 3.5 | 151.6k |
| A5 | 7 | A | alone | 0/2 | 4.0 | 255.4k |
| E5 | 7 | D | alone | 2/2 | 1.5 | 19.0k |
| C3 | 1 | C | library | 2/2 | 1.0 | 6.6k |
| C6 | 1 | cross | library | 2/2 | 2.0 | 43.9k |
| A3 | 2 | A | library | 2/2 | 1.5 | 12.3k |
| A6 | 2 | A | library | 2/2 | 2.0 | 18.3k |
| C5 | 2 | C | library | 2/2 | 2.0 | 11.3k |
| D1 | 2 | D | library | 2/2 | 2.0 | 12.5k |
| E3 | 2 | D | library | 2/2 | 1.0 | 4.0k |
| C4 | 3 | C | library | 2/2 | 2.0 | 11.7k |
| D2 | 3 | D | library | 2/2 | 1.0 | 3.5k |
| E1 | 3 | D | library | 2/2 | 1.0 | 3.5k |
| F2 | 3 | A | library | 2/2 | 1.5 | 5.5k |
| X1 | 3 | cross | library | 2/2 | 4.0 | 73.5k |
| X3 | 3 | cross | library | 2/2 | 1.0 | 4.0k |
| B3 | 4 | B | library | 2/2 | 1.5 | 6.4k |
| E2 | 4 | D | library | 2/2 | 1.0 | 3.9k |
| X6 | 4 | cross | library | 2/2 | 3.0 | 33.8k |
| A7 | 5 | A | library | 2/2 | 1.0 | 7.3k |
| B5 | 5 | B | library | 2/2 | 1.0 | 5.1k |
| D3 | 5 | D | library | 2/2 | 2.5 | 22.2k |
| E4 | 5 | D | library | 2/2 | 1.0 | 5.0k |
| X2 | 5 | cross | library | 2/2 | 1.0 | 6.3k |
| X7 | 5 | D | library | 2/2 | 1.0 | 4.6k |
| F3 | 6 | A | library | 2/2 | 1.0 | 4.5k |
| X4 | 6 | D | library | 2/2 | 1.0 | 4.8k |
| X5 | 6 | D | library | 2/2 | 1.5 | 6.9k |
| A5 | 7 | A | library | 2/2 | 1.5 | 12.3k |
| E5 | 7 | D | library | 2/2 | 1.0 | 4.4k |
