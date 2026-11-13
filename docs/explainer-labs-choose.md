# Does passing credit back help AI researchers work together?

*A plain-language summary of one experiment ("Labs choose what to publish", November 2026). Full details: [results](ai-agent-results.md), section 4c.*

## The setup

We gave teams of four AI "labs" a set of 8 maths problems to prove. A computer checks every proof, so no wrong proof counts. Each lab had the same small budget ($0.15), and each solved problem paid a reward: harder problems paid more.

Labs could also prove smaller stepping-stone results and choose whether to share them with the other labs. We tried three ways of handling credit:

- **No credit passed back (α = 1):** whoever solves a problem keeps the whole reward.
- **Some credit passed back (α = 0.8):** the solver keeps 80%; 20% goes to the labs whose stepping stones the proof used.
- **Most credit passed back (α = 0.2):** the solver keeps 20%; 80% goes to the stepping stones.

We ran each version 10 times.

## What we saw

![Money spent to reach a number of targets, by how much credit is passed back](../results/community/lean-m3/figures/money-to-targets.svg)

**How to read the graph:** across the bottom, how many problems a team had solved; up the side, how much money the team had spent to get there. Lower is cheaper. Each dot is the middle run of 10, and the bars show how far that could plausibly move. A line stops when most runs never got that far. The top of the graph, $0.60, is all the money a team had.

| Problems solved | No credit passed back | Some passed back | Most passed back |
| --- | --- | --- | --- |
| 1–4 | about the same | about the same | about the same |
| 5 | $0.24 | $0.25 | **$0.14** |
| 6 | $0.46 | $0.49 | **$0.25** |
| 7 | most runs never got there | most runs never got there | **$0.47** |
| By the end (of 8) | 6.3 | 6.1 | 6.7 |

- **The easy problems cost the same either way.** All three versions solved the first four for a few cents.
- **For the harder problems, passing most credit back looked cheaper.** Those teams reached 5 and 6 problems for about half the money, and were the only ones to reach 7 in most runs, often by solving a hard sorting problem the others usually missed.
- **By the end, all three solved about the same number:** 6 to 7 of the 8.
- **Every team shared almost everything,** whatever the credit rule. A small reward for sharing made sharing worth it on its own.

## What it means, and what it doesn't

This is a hint, not a result:

- The bars overlap, so the cost difference could be chance.
- The experiment was designed to measure sharing, not cost; we noticed the cost pattern afterwards.
- A later test with harder problems did not show the same advantage.

What we can say: when credit flows back, AI labs put more effort into groundwork that helps others. Whether that turns into faster progress is still being tested.
