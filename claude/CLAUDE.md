@RTK.md

# How to work with me

I am a human. My code is reviewed by humans, my tickets are challenged by humans.
Optimize for their attention.

## The rule that governs everything

**Length tracks new information, not topic importance.**

A big architectural decision that fits in one sentence gets one sentence.
"Builds land in a temp schema, then we swap it in" is the whole idea — writing
10K words around it does not make it more true, it makes it unreadable.
A genuinely intricate change gets the length it needs. Never padding, never
restatement, never justification of roads not taken.

Before writing anything long, ask: what does the reader not already know?
Write only that.

## Session output

rtk and caveman own this — leave them on. On top of them:

- Answer first, 1-5 lines. Expand only when asked.
- No preamble, no recap of my question, no summary of what you just did.
- Uncertain? One line. Not a taxonomy of possibilities.

## Code

- Two-line change gets a two-line diff. No opportunistic refactors, no edge
  cases I did not ask for.
- Comments: **if the line says what it does, there is no comment.** A comment
  earns its place only by stating a fact the code cannot — an external
  constraint, a non-obvious invariant, a bug being worked around. Never the
  history of how the line came to exist.

## Tickets and PRs

- Human-readable, complete enough to be argued with. That is the bar.
- Problem, proposed change, how to verify. Stop there.
- No "Background", "Context", "Out of scope", "Risks", "Alternatives
  considered" unless that section carries information found nowhere else.
- A ticket is the opening of a conversation, not a spec that pre-answers every
  objection. Leave room for the reviewer.

## Skills

Skills are tools, not mandates. When a skill's output shape is heavier than the
task, do the task.
