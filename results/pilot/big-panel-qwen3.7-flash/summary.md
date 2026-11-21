# Lean pilot: big-panel-qwen3.7-flash

How hard each theorem of the Lean problem set is for a real agent. 

- **Agent:** `qwen/qwen3.7-flash` via openrouter, reasoning effort high. One attempt is a first proof plus up to 3 repairs on Lean's error messages.
- **Rules:** Lean 4.35 core only; `grind` banned; the checker accepts a proof only if it uses nothing beyond the library given and Lean's standard axioms.
- **Conditions:** *library*: the theorems it rests on in the reference tree are given; *alone*: posted targets with an empty library.
- **Attempts:** 108; tokens in 329.3k (plus 866.3k cached), out 3629.6k; cost $0.48 ($0.004 per attempt).

Theorem ids are the anonymous ids of [worlds/lean-reference.json](../../../worlds/lean-reference.json); statements and proofs are in lean/Reference/.

## Success by level (library)

| depth | theorems | attempts | proved | success per attempt | tokens per attempt |
| --- | --- | --- | --- | --- | --- |
| 1 | 2 | 4 | 0 | 0% | 37.8k |
| 2 | 5 | 10 | 2 | 20% | 33.8k |
| 3 | 6 | 12 | 10 | 83% | 14.5k |
| 4 | 3 | 6 | 4 | 67% | 23.7k |
| 5 | 6 | 12 | 5 | 42% | 34.3k |
| 6 | 3 | 6 | 4 | 67% | 15.6k |
| 7 | 2 | 4 | 2 | 50% | 42.3k |

## Do targets need their lemmas?

| target | depth | alone | with library |
| --- | --- | --- | --- |
| C3 | 1 | 0/2 | 0/2 |
| C6 | 1 | 0/2 | 0/2 |
| A3 | 2 | 0/2 | 0/2 |
| A6 | 2 | 0/2 | 0/2 |
| C5 | 2 | 0/2 | 1/2 |
| D1 | 2 | 0/2 | 0/2 |
| E3 | 2 | 0/2 | 1/2 |
| C4 | 3 | 0/2 | 2/2 |
| D2 | 3 | 0/2 | 2/2 |
| E1 | 3 | 0/2 | 2/2 |
| F2 | 3 | 0/2 | 2/2 |
| X1 | 3 | 0/2 | 0/2 |
| X3 | 3 | 0/2 | 2/2 |
| B3 | 4 | 0/2 | 2/2 |
| E2 | 4 | 0/2 | 2/2 |
| X6 | 4 | 0/2 | 0/2 |
| A7 | 5 | 0/2 | 0/2 |
| B5 | 5 | 0/2 | 2/2 |
| D3 | 5 | 0/2 | 1/2 |
| E4 | 5 | 0/2 | 2/2 |
| X2 | 5 | 0/2 | 0/2 |
| X7 | 5 | 0/2 | 0/2 |
| F3 | 6 | 0/2 | 2/2 |
| X4 | 6 | 0/2 | 1/2 |
| X5 | 6 | 0/2 | 1/2 |
| A5 | 7 | 0/2 | 0/2 |
| E5 | 7 | 0/2 | 2/2 |

A target proved alone in most attempts is too easy: its lemmas are not needed.

## Every theorem

| id | depth | area | condition | proved | mean turns | tokens per attempt |
| --- | --- | --- | --- | --- | --- | --- |
| C3 | 1 | C | alone | 0/2 | 4.0 | 27.2k |
| C6 | 1 | cross | alone | 0/2 | 4.0 | 43.6k |
| A3 | 2 | A | alone | 0/2 | 4.0 | 73.8k |
| A6 | 2 | A | alone | 0/2 | 4.0 | 81.2k |
| C5 | 2 | C | alone | 0/2 | 4.0 | 35.6k |
| D1 | 2 | D | alone | 0/2 | 4.0 | 60.9k |
| E3 | 2 | D | alone | 0/2 | 4.0 | 22.9k |
| C4 | 3 | C | alone | 0/2 | 4.0 | 47.8k |
| D2 | 3 | D | alone | 0/2 | 4.0 | 55.0k |
| E1 | 3 | D | alone | 0/2 | 4.0 | 32.6k |
| F2 | 3 | A | alone | 0/2 | 4.0 | 99.5k |
| X1 | 3 | cross | alone | 0/2 | 4.0 | 67.0k |
| X3 | 3 | cross | alone | 0/2 | 4.0 | 47.5k |
| B3 | 4 | B | alone | 0/2 | 4.0 | 51.5k |
| E2 | 4 | D | alone | 0/2 | 4.0 | 47.9k |
| X6 | 4 | cross | alone | 0/2 | 4.0 | 57.2k |
| A7 | 5 | A | alone | 0/2 | 4.0 | 80.4k |
| B5 | 5 | B | alone | 0/2 | 4.0 | 58.8k |
| D3 | 5 | D | alone | 0/2 | 4.0 | 68.7k |
| E4 | 5 | D | alone | 0/2 | 4.0 | 77.0k |
| X2 | 5 | cross | alone | 0/2 | 4.0 | 75.9k |
| X7 | 5 | D | alone | 0/2 | 4.0 | 77.9k |
| F3 | 6 | A | alone | 0/2 | 4.0 | 83.9k |
| X4 | 6 | D | alone | 0/2 | 4.0 | 79.0k |
| X5 | 6 | D | alone | 0/2 | 4.0 | 72.6k |
| A5 | 7 | A | alone | 0/2 | 4.0 | 86.5k |
| E5 | 7 | D | alone | 0/2 | 4.0 | 60.1k |
| C3 | 1 | C | library | 0/2 | 4.0 | 27.0k |
| C6 | 1 | cross | library | 0/2 | 4.0 | 48.6k |
| A3 | 2 | A | library | 0/2 | 4.0 | 42.8k |
| A6 | 2 | A | library | 0/2 | 4.0 | 45.8k |
| C5 | 2 | C | library | 1/2 | 4.0 | 26.5k |
| D1 | 2 | D | library | 0/2 | 4.0 | 37.7k |
| E3 | 2 | D | library | 1/2 | 3.0 | 16.3k |
| C4 | 3 | C | library | 2/2 | 1.0 | 7.5k |
| D2 | 3 | D | library | 2/2 | 1.0 | 4.0k |
| E1 | 3 | D | library | 2/2 | 1.5 | 5.1k |
| F2 | 3 | A | library | 2/2 | 1.0 | 4.7k |
| X1 | 3 | cross | library | 0/2 | 4.0 | 52.3k |
| X3 | 3 | cross | library | 2/2 | 2.5 | 13.7k |
| B3 | 4 | B | library | 2/2 | 3.0 | 15.1k |
| E2 | 4 | D | library | 2/2 | 2.0 | 9.0k |
| X6 | 4 | cross | library | 0/2 | 4.0 | 47.1k |
| A7 | 5 | A | library | 0/2 | 4.0 | 74.0k |
| B5 | 5 | B | library | 2/2 | 3.0 | 21.7k |
| D3 | 5 | D | library | 1/2 | 2.5 | 18.6k |
| E4 | 5 | D | library | 2/2 | 2.0 | 13.0k |
| X2 | 5 | cross | library | 0/2 | 4.0 | 45.4k |
| X7 | 5 | D | library | 0/2 | 4.0 | 33.5k |
| F3 | 6 | A | library | 2/2 | 1.0 | 6.3k |
| X4 | 6 | D | library | 1/2 | 3.0 | 14.1k |
| X5 | 6 | D | library | 1/2 | 4.0 | 26.4k |
| A5 | 7 | A | library | 0/2 | 4.0 | 80.1k |
| E5 | 7 | D | library | 2/2 | 1.0 | 4.5k |
