# Phase 0 checker: stress test

32 of 32 cases as expected. 2026-11-06.

| Case | Should | Did | Why it is here | Lean said |
| --- | --- | --- | --- | --- |
| a wrong draft, then the right proof | accept | accept | the last block counts |  |
| tactics at the margin | accept | accept | the commonest reply |  |
| theorem repeated, prose around | accept | accept | models often repeat the whole file |  |
| tactics indented four spaces | accept | accept | deeper margin |  |
| Windows line endings | accept | accept | CRLF |  |
| tabs | accept | accept | tab indents |  |
| `by` on its own line | accept | accept | layout of `:= by` |  |
| statement on one line | accept | accept | line breaks differ |  |
| stated as lemma | accept | accept | `lemma` for `theorem` |  |
| as an example | accept | accept | unnamed form of the same statement |  |
| sorry | reject | reject | the plain cheat | `sorry` and `admit` are not allowed |
| admit | reject | reject |  | `sorry` and `admit` are not allowed |
| set_option before tactics | accept | accept | a normal option inside the proof |  |
| sorryAx, axioms report faked | reject | reject | rewrites our `#print axioms` to print a clean report | commands (`#…`, `run_cmd`, …) are not allowed |
| faked report, indented | reject | reject | same, hidden by indenting | commands (`#…`, `run_cmd`, …) are not allowed |
| second problem, plain | accept | accept | a second statement |  |
| sorryAx by name | reject | reject | not the word `sorry`, so the text screen misses it; `#print axioms` must catch it | the proof is incomplete (Lean reports `sorry`) |
| new syntax mid-line | reject | reject | the screen must catch it anywhere in a line | new syntax and macros are not allowed in a proof |
| same line, past the screen | reject | reject | a command can start mid-line | the proof is incomplete (Lean reports `sorry`) |
| axiom after the proof | reject | reject | a declaration after the proof | the proof must not start new declarations |
| faked report, past the screen | reject | reject | the text screen off: the separate axioms check must still catch it | the proof is incomplete (Lean reports `sorry`) |
| new axiom before the theorem | reject | reject | only what follows `:= by` is used | line 1 of your proof, column 8: Unknown identifier `cheat.elim` |
| native_decide | reject | reject | trusts compiled code | `native_decide`, `unsafe` and similar are not allowed |
| ofReduceBool | reject | reject |  | `native_decide`, `unsafe` and similar are not allowed |
| proof uses itself | reject | reject | circular | in the statement: fail to show termination for |
| weaker statement | reject | reject | the statement must not change | line 1 of your proof, column 2: Tactic `assumption` failed |
| no code block | reject | reject |  | no proof found in the reply |
| empty reply | reject | reject |  | no proof found in the reply |
| hits a limit | reject | reject | Lean stops it | line 1 of your proof, column 40: maximum recursion depth has been reached |
| proof cut short | reject | reject | unfinished | line 2 of your proof, column 37: unsolved goals |
| tactics after the goal is closed | reject | reject | "no goals" error | line 6 of your proof, column 2: No goals to be solved |
| never finishes | reject | reject | no limit inside Lean: our timeout must stop it | line 3 of your proof, column 2: (deterministic) timeout at `«tactic execution»`, maximum number of heartbeats  |
