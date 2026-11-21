# Lean pilot: big-panel-deepseek-v4.1-flash

How hard each theorem of the Lean problem set is for a real agent. 

- **Agent:** `deepseek/deepseek-v4.1-flash` via openrouter, reasoning effort high. One attempt is a first proof plus up to 3 repairs on Lean's error messages.
- **Rules:** Lean 4.35 core only; `grind` banned; the checker accepts a proof only if it uses nothing beyond the library given and Lean's standard axioms.
- **Conditions:** *library*: the theorems it rests on in the reference tree are given; *alone*: posted targets with an empty library.
- **Attempts:** 108; tokens in 131.0k (plus 572.8k cached), out 5770.8k; cost $1.20 ($0.011 per attempt).

Theorem ids are the anonymous ids of [worlds/lean-reference.json](../../../worlds/lean-reference.json); statements and proofs are in lean/Reference/.

## Success by level (library)

| depth | theorems | attempts | proved | success per attempt | tokens per attempt |
| --- | --- | --- | --- | --- | --- |
| 1 | 2 | 4 | 3 | 75% | 68.2k |
| 2 | 5 | 10 | 9 | 90% | 32.3k |
| 3 | 6 | 12 | 10 | 83% | 24.6k |
| 4 | 3 | 6 | 4 | 67% | 43.6k |
| 5 | 6 | 12 | 12 | 100% | 23.2k |
| 6 | 3 | 6 | 6 | 100% | 4.0k |
| 7 | 2 | 4 | 2 | 50% | 62.8k |

## Do targets need their lemmas?

| target | depth | alone | with library |
| --- | --- | --- | --- |
| C3 | 1 | 2/2 | 2/2 |
| C6 | 1 | 0/2 | 1/2 |
| A3 | 2 | 2/2 | 2/2 |
| A6 | 2 | 0/2 | 2/2 |
| C5 | 2 | 0/2 | 1/2 |
| D1 | 2 | 2/2 | 2/2 |
| E3 | 2 | 2/2 | 2/2 |
| C4 | 3 | 2/2 | 2/2 |
| D2 | 3 | 2/2 | 2/2 |
| E1 | 3 | 2/2 | 2/2 |
| F2 | 3 | 0/2 | 2/2 |
| X1 | 3 | 0/2 | 0/2 |
| X3 | 3 | 0/2 | 2/2 |
| B3 | 4 | 2/2 | 2/2 |
| E2 | 4 | 1/2 | 2/2 |
| X6 | 4 | 0/2 | 0/2 |
| A7 | 5 | 0/2 | 2/2 |
| B5 | 5 | 0/2 | 2/2 |
| D3 | 5 | 2/2 | 2/2 |
| E4 | 5 | 1/2 | 2/2 |
| X2 | 5 | 2/2 | 2/2 |
| X7 | 5 | 2/2 | 2/2 |
| F3 | 6 | 0/2 | 2/2 |
| X4 | 6 | 2/2 | 2/2 |
| X5 | 6 | 0/2 | 2/2 |
| A5 | 7 | 0/2 | 0/2 |
| E5 | 7 | 0/2 | 2/2 |

A target proved alone in most attempts is too easy: its lemmas are not needed.

## Every theorem

| id | depth | area | condition | proved | mean turns | tokens per attempt |
| --- | --- | --- | --- | --- | --- | --- |
| C3 | 1 | C | alone | 2/2 | 2.5 | 57.7k |
| C6 | 1 | cross | alone | 0/2 | 4.0 | 96.4k |
| A3 | 2 | A | alone | 2/2 | 2.0 | 65.6k |
| A6 | 2 | A | alone | 0/2 | 4.0 | 137.8k |
| C5 | 2 | C | alone | 0/2 | 4.0 | 112.8k |
| D1 | 2 | D | alone | 2/2 | 1.0 | 14.4k |
| E3 | 2 | D | alone | 2/2 | 1.0 | 6.1k |
| C4 | 3 | C | alone | 2/2 | 3.0 | 62.2k |
| D2 | 3 | D | alone | 2/2 | 1.0 | 27.1k |
| E1 | 3 | D | alone | 2/2 | 1.0 | 12.5k |
| F2 | 3 | A | alone | 0/2 | 4.0 | 131.2k |
| X1 | 3 | cross | alone | 0/2 | 4.0 | 128.1k |
| X3 | 3 | cross | alone | 0/2 | 4.0 | 107.0k |
| B3 | 4 | B | alone | 2/2 | 1.5 | 26.4k |
| E2 | 4 | D | alone | 1/2 | 4.0 | 113.8k |
| X6 | 4 | cross | alone | 0/2 | 4.0 | 128.2k |
| A7 | 5 | A | alone | 0/2 | 4.0 | 124.8k |
| B5 | 5 | B | alone | 0/2 | 4.0 | 136.8k |
| D3 | 5 | D | alone | 2/2 | 3.0 | 57.1k |
| E4 | 5 | D | alone | 1/2 | 3.5 | 111.4k |
| X2 | 5 | cross | alone | 2/2 | 2.5 | 57.1k |
| X7 | 5 | D | alone | 2/2 | 2.5 | 55.4k |
| F3 | 6 | A | alone | 0/2 | 4.0 | 136.8k |
| X4 | 6 | D | alone | 2/2 | 3.0 | 85.0k |
| X5 | 6 | D | alone | 0/2 | 4.0 | 137.3k |
| A5 | 7 | A | alone | 0/2 | 4.0 | 137.5k |
| E5 | 7 | D | alone | 0/2 | 4.0 | 117.5k |
| C3 | 1 | C | library | 2/2 | 1.5 | 43.7k |
| C6 | 1 | cross | library | 1/2 | 4.0 | 92.7k |
| A3 | 2 | A | library | 2/2 | 1.5 | 42.3k |
| A6 | 2 | A | library | 2/2 | 2.5 | 67.5k |
| C5 | 2 | C | library | 1/2 | 3.0 | 39.5k |
| D1 | 2 | D | library | 2/2 | 1.5 | 8.7k |
| E3 | 2 | D | library | 2/2 | 1.0 | 3.7k |
| C4 | 3 | C | library | 2/2 | 1.0 | 4.5k |
| D2 | 3 | D | library | 2/2 | 1.0 | 2.7k |
| E1 | 3 | D | library | 2/2 | 1.0 | 2.5k |
| F2 | 3 | A | library | 2/2 | 1.0 | 2.7k |
| X1 | 3 | cross | library | 0/2 | 4.0 | 130.9k |
| X3 | 3 | cross | library | 2/2 | 1.0 | 4.1k |
| B3 | 4 | B | library | 2/2 | 1.0 | 4.9k |
| E2 | 4 | D | library | 2/2 | 1.0 | 2.6k |
| X6 | 4 | cross | library | 0/2 | 4.0 | 123.4k |
| A7 | 5 | A | library | 2/2 | 3.0 | 53.6k |
| B5 | 5 | B | library | 2/2 | 1.0 | 3.5k |
| D3 | 5 | D | library | 2/2 | 1.0 | 12.6k |
| E4 | 5 | D | library | 2/2 | 1.0 | 4.6k |
| X2 | 5 | cross | library | 2/2 | 3.5 | 61.5k |
| X7 | 5 | D | library | 2/2 | 1.0 | 3.4k |
| F3 | 6 | A | library | 2/2 | 1.0 | 3.6k |
| X4 | 6 | D | library | 2/2 | 1.5 | 5.0k |
| X5 | 6 | D | library | 2/2 | 1.0 | 3.3k |
| A5 | 7 | A | library | 0/2 | 4.0 | 122.3k |
| E5 | 7 | D | library | 2/2 | 1.0 | 3.2k |
