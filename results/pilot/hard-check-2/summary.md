# Lean pilot: hard-check-2

How hard each theorem of the Lean problem set is for a real agent. 

- **Agent:** `deepseek/deepseek-v4.1-flash` via openrouter, reasoning effort high. One attempt is a first proof plus up to 3 repairs on Lean's error messages.
- **Rules:** Lean 4.35 core only; `grind` banned; the checker accepts a proof only if it uses nothing beyond the library given and Lean's standard axioms.
- **Conditions:** *library*: the theorems it rests on in the reference tree are given; *alone*: posted targets with an empty library.
- **Attempts:** 36; tokens in 8.5k (plus 168.1k cached), out 3682.4k; cost $1.24 ($0.034 per attempt).

Theorem ids are the anonymous ids of [worlds/lean-reference.json](../../../worlds/lean-reference.json); statements and proofs are private until the experiment.

## Success by level (library)

| depth | theorems | attempts | proved | success per attempt | tokens per attempt |
| --- | --- | --- | --- | --- | --- |
| 2 | 1 | 3 | 3 | 100% | 76.3k |
| 4 | 4 | 12 | 6 | 50% | 68.8k |
| 5 | 1 | 3 | 0 | 0% | 134.3k |

## Do targets need their lemmas?

| target | depth | alone | with library |
| --- | --- | --- | --- |
| H6 | 2 | 0/3 | 3/3 |
| H1 | 4 | 0/3 | 0/3 |
| H3 | 4 | 0/3 | 0/3 |
| H4 | 4 | 0/3 | 3/3 |
| H5 | 4 | 0/3 | 3/3 |
| H2 | 5 | 0/3 | 0/3 |

A target proved alone in most attempts is too easy: its lemmas are not needed.

## Every theorem

| id | depth | area | condition | proved | mean turns | tokens per attempt |
| --- | --- | --- | --- | --- | --- | --- |
| H6 | 2 | cross | alone | 0/3 | 4.0 | 133.4k |
| H1 | 4 | A | alone | 0/3 | 4.0 | 133.4k |
| H3 | 4 | cross | alone | 0/3 | 4.0 | 133.5k |
| H4 | 4 | B | alone | 0/3 | 4.0 | 133.4k |
| H5 | 4 | B | alone | 0/3 | 4.0 | 133.3k |
| H2 | 5 | A | alone | 0/3 | 4.0 | 133.4k |
| H6 | 2 | cross | library | 3/3 | 3.0 | 76.3k |
| H1 | 4 | A | library | 0/3 | 4.0 | 133.9k |
| H3 | 4 | cross | library | 0/3 | 4.0 | 134.4k |
| H4 | 4 | B | library | 3/3 | 1.0 | 3.6k |
| H5 | 4 | B | library | 3/3 | 1.0 | 3.3k |
| H2 | 5 | A | library | 0/3 | 4.0 | 134.3k |
