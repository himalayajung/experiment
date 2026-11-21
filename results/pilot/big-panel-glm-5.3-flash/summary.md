# Lean pilot: big-panel-glm-5.3-flash

How hard each theorem of the Lean problem set is for a real agent. 

- **Agent:** `z-ai/glm-5.3-flash` via openrouter, reasoning effort high. One attempt is a first proof plus up to 3 repairs on Lean's error messages.
- **Rules:** Lean 4.35 core only; `grind` banned; the checker accepts a proof only if it uses nothing beyond the library given and Lean's standard axioms.
- **Conditions:** *library*: the theorems it rests on in the reference tree are given; *alone*: posted targets with an empty library.
- **Attempts:** 108; tokens in 4024.9k (plus 3065.8k cached), out 3785.4k; cost $0.55 ($0.005 per attempt).

Theorem ids are the anonymous ids of [worlds/lean-reference.json](../../../worlds/lean-reference.json); statements and proofs are in lean/Reference/.

## Success by level (library)

| depth | theorems | attempts | proved | success per attempt | tokens per attempt |
| --- | --- | --- | --- | --- | --- |
| 1 | 2 | 4 | 2 | 50% | 95.1k |
| 2 | 5 | 10 | 10 | 100% | 37.4k |
| 3 | 6 | 12 | 12 | 100% | 32.2k |
| 4 | 3 | 6 | 4 | 67% | 71.0k |
| 5 | 6 | 12 | 12 | 100% | 26.9k |
| 6 | 3 | 6 | 6 | 100% | 4.7k |
| 7 | 2 | 4 | 3 | 75% | 85.0k |

## Do targets need their lemmas?

| target | depth | alone | with library |
| --- | --- | --- | --- |
| C3 | 1 | 2/2 | 2/2 |
| C6 | 1 | 2/2 | 0/2 |
| A3 | 2 | 1/2 | 2/2 |
| A6 | 2 | 0/2 | 2/2 |
| C5 | 2 | 2/2 | 2/2 |
| D1 | 2 | 2/2 | 2/2 |
| E3 | 2 | 2/2 | 2/2 |
| C4 | 3 | 2/2 | 2/2 |
| D2 | 3 | 2/2 | 2/2 |
| E1 | 3 | 2/2 | 2/2 |
| F2 | 3 | 0/2 | 2/2 |
| X1 | 3 | 0/2 | 2/2 |
| X3 | 3 | 0/2 | 2/2 |
| B3 | 4 | 2/2 | 2/2 |
| E2 | 4 | 2/2 | 2/2 |
| X6 | 4 | 1/2 | 0/2 |
| A7 | 5 | 0/2 | 2/2 |
| B5 | 5 | 0/2 | 2/2 |
| D3 | 5 | 1/2 | 2/2 |
| E4 | 5 | 1/2 | 2/2 |
| X2 | 5 | 2/2 | 2/2 |
| X7 | 5 | 1/2 | 2/2 |
| F3 | 6 | 0/2 | 2/2 |
| X4 | 6 | 1/2 | 2/2 |
| X5 | 6 | 1/2 | 2/2 |
| A5 | 7 | 0/2 | 1/2 |
| E5 | 7 | 2/2 | 2/2 |

A target proved alone in most attempts is too easy: its lemmas are not needed.

## Every theorem

| id | depth | area | condition | proved | mean turns | tokens per attempt |
| --- | --- | --- | --- | --- | --- | --- |
| C3 | 1 | C | alone | 2/2 | 2.0 | 49.0k |
| C6 | 1 | cross | alone | 2/2 | 3.0 | 119.2k |
| A3 | 2 | A | alone | 1/2 | 4.0 | 221.8k |
| A6 | 2 | A | alone | 0/2 | 4.0 | 220.2k |
| C5 | 2 | C | alone | 2/2 | 3.5 | 134.9k |
| D1 | 2 | D | alone | 2/2 | 1.5 | 36.4k |
| E3 | 2 | D | alone | 2/2 | 1.0 | 3.3k |
| C4 | 3 | C | alone | 2/2 | 2.5 | 94.9k |
| D2 | 3 | D | alone | 2/2 | 2.0 | 38.6k |
| E1 | 3 | D | alone | 2/2 | 2.0 | 10.3k |
| F2 | 3 | A | alone | 0/2 | 4.0 | 296.8k |
| X1 | 3 | cross | alone | 0/2 | 4.0 | 181.5k |
| X3 | 3 | cross | alone | 0/2 | 4.0 | 181.3k |
| B3 | 4 | B | alone | 2/2 | 2.5 | 53.7k |
| E2 | 4 | D | alone | 2/2 | 2.5 | 115.1k |
| X6 | 4 | cross | alone | 1/2 | 4.0 | 251.4k |
| A7 | 5 | A | alone | 0/2 | 4.0 | 328.7k |
| B5 | 5 | B | alone | 0/2 | 4.0 | 270.0k |
| D3 | 5 | D | alone | 1/2 | 3.5 | 157.4k |
| E4 | 5 | D | alone | 1/2 | 3.5 | 189.3k |
| X2 | 5 | cross | alone | 2/2 | 2.5 | 94.3k |
| X7 | 5 | D | alone | 1/2 | 3.5 | 133.1k |
| F3 | 6 | A | alone | 0/2 | 4.0 | 300.4k |
| X4 | 6 | D | alone | 1/2 | 4.0 | 164.1k |
| X5 | 6 | D | alone | 1/2 | 4.0 | 249.7k |
| A5 | 7 | A | alone | 0/2 | 4.0 | 314.0k |
| E5 | 7 | D | alone | 2/2 | 3.0 | 99.0k |
| C3 | 1 | C | library | 2/2 | 1.5 | 40.1k |
| C6 | 1 | cross | library | 0/2 | 4.0 | 150.2k |
| A3 | 2 | A | library | 2/2 | 2.5 | 57.7k |
| A6 | 2 | A | library | 2/2 | 3.0 | 103.2k |
| C5 | 2 | C | library | 2/2 | 3.5 | 16.4k |
| D1 | 2 | D | library | 2/2 | 1.5 | 5.8k |
| E3 | 2 | D | library | 2/2 | 1.5 | 3.9k |
| C4 | 3 | C | library | 2/2 | 1.5 | 6.2k |
| D2 | 3 | D | library | 2/2 | 1.5 | 3.5k |
| E1 | 3 | D | library | 2/2 | 1.0 | 2.2k |
| F2 | 3 | A | library | 2/2 | 1.0 | 2.2k |
| X1 | 3 | cross | library | 2/2 | 3.5 | 176.8k |
| X3 | 3 | cross | library | 2/2 | 1.0 | 2.5k |
| B3 | 4 | B | library | 2/2 | 1.0 | 2.4k |
| E2 | 4 | D | library | 2/2 | 1.0 | 2.3k |
| X6 | 4 | cross | library | 0/2 | 4.0 | 208.2k |
| A7 | 5 | A | library | 2/2 | 2.0 | 71.9k |
| B5 | 5 | B | library | 2/2 | 2.0 | 6.1k |
| D3 | 5 | D | library | 2/2 | 1.5 | 10.2k |
| E4 | 5 | D | library | 2/2 | 1.0 | 3.1k |
| X2 | 5 | cross | library | 2/2 | 2.5 | 62.7k |
| X7 | 5 | D | library | 2/2 | 2.5 | 7.7k |
| F3 | 6 | A | library | 2/2 | 1.0 | 3.3k |
| X4 | 6 | D | library | 2/2 | 1.0 | 3.0k |
| X5 | 6 | D | library | 2/2 | 2.5 | 7.9k |
| A5 | 7 | A | library | 1/2 | 4.0 | 167.2k |
| E5 | 7 | D | library | 2/2 | 1.0 | 2.8k |
