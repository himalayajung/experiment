# Spend all: labs must spend all their money, 4 setups × 20 runs, $0.15 a lab (Nov 7)

**Question:** For the same agents, checker and money, does a community prove more targets when value flows back (OSO) than when results are only shared, or kept private until a target is proved?

**Answer:** OSO, α 0.8 proved 5.80 (95% range 5.33 to 6.27) targets of 8 a run; Shared library 5.85 (95% range 5.58 to 6.12). Difference: -0.05 (95% range -0.59 to 0.49). OSO, α 0.2 proved 6.25 (95% range 5.80 to 6.70) targets of 8 a run; Shared library 5.85 (95% range 5.58 to 6.12). Difference: 0.40 (95% range -0.13 to 0.93).

![Spend all: labs must spend all their money, 4 setups × 20 runs, $0.15 a lab (Nov 7)](figures/progress.svg)

| society | OSO parameters | targets proved | money to 3 targets | spent | lemmas proved | built on another lab | lemmas proved twice | targets proved twice |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Shared library | public at once · α 1 · m 0 · m_bit 0 · f 0 | 5.85 ± 0.59 of 8 | $0.06 (20 of 20 got there) | $0.61 | 7.15 | 2.15 | 0.15 | 3.55 |
| OSO, α 0.8 | public at once · α 0.8 · m 0 · m_bit 0 · f 0 | 5.80 ± 1.01 of 8 | $0.07 (20 of 20 got there) | $0.60 | 10.65 | 3.60 | 0.15 | 3.00 |
| OSO, α 0.2 | public at once · α 0.2 · m 0 · m_bit 0 · f 0 | 6.25 ± 0.97 of 8 | $0.07 (20 of 20 got there) | $0.60 | 13.75 | 5.80 | 0.20 | 2.85 |
| Traditional | public when a target is proved · α 1 · m 0 · m_bit 0 · f 0 | 5.80 ± 0.77 of 8 | $0.07 (20 of 20 got there) | $0.60 | 7.20 | 0.40 | 0.40 | 2.55 |

**Design** (fixed before the run): compared Shared library, OSO, α 0.8, OSO, α 0.2, Traditional · held the same: the same 4 agents (the single agent: the first, with all the money), $0.60 in all, Lean checks every proof · measure: targets proved by the end of a run, of 8; money to reach 3 targets is shown beside it, higher is better · 20 runs per setup, not paired. Cost: $48.68 as charged.

**Caveats:**
- Labs could not stop early: each worked until its money or the rounds ran out, so setups are compared at the same money spent.
- Rewards differ from the current simulation model: the knowledge reward is off (the simulation pays 1 per new bit since v5): Lean has no agreed measure of a result's new knowledge yet, see docs/design.md; value flowing back is split by the money spent proving each parent, not by the work a parent saves (1/p) as in the simulation.
- Table values are mean ± standard deviation over runs. Above: means with 95% ranges (Student t), and differences between setups with their 95% ranges; runs are not paired.

<details><summary>Details</summary>

Main Lean experiment, Spend all (pre-registered in notes/lean-main-experiment.md, 2026-11-07): does flow-back add anything beyond sharing, at the same money spent? Shared library, OSO α 0.8 and OSO α 0.2, 20 runs each; labs cannot stop early. Traditional (20 runs) added later the same day, after the other three had run, as the reference point. These runs used the earlier prompt wording, which differed between setups by more than the rules (see docs/lean-experiment.md).

![Verified targets for the money](figures/progress.svg)

- **Societies:** single agent (one lab, everyone's money); independent labs (nothing shared, a target counts when any lab proves it); shared library (everything public at once, no value flows back); planner (lab 1 assigns work to the others each round, results shared, nothing flows back); traditional (private until a target is proved); OSO (public at once, value flows back to what a result used; α is the share an author keeps).
- **Agents:** `deepseek/deepseek-v4.1-flash`, `deepseek/deepseek-v4.1-flash`, `deepseek/deepseek-v4.1-flash`, `deepseek/deepseek-v4.1-flash`; up to 60 rounds; up to 2 repairs on Lean's errors per action.

Transcripts are not in this repository.

</details>
