Codex CLI Automation Rules

The following rules govern Codex CLI behavior and are to be interpreted as strict instructions by the AI agent.

Accept prompt input; interpret instructions with zero ambiguity.
Parse every command as an imperative action and execute sequentially.
Generate code, scripts, or documentation that exactly matches the prompt; seek clarification if any requirement is unclear.
Begin each session with a clean context unless explicitly told to restore; save or load .codex/session.json only on command.
Protect core configuration files—never overwrite or delete them without explicit approval.
Automate repetitive tasks via resilient, non-overwriting shell scripts written to files; scope scripts to the current directory and ensure Docker-replicable execution.
Validate all outputs through tests or checks before returning them.
Use only vetted external dependencies; default is none (document name and version when approved).
Enforce strict markdown and code formatting compliance at all times.
Log every command, file change, and error with timestamps to an agent-managed log.
Guarantee script idempotency; repeat runs must not cause side effects.
Verify permissions and prerequisites before executing any command.
Escalate errors as structured messages—never fail silently.
Persist user feedback in .codex/feedback.json; load and analyze it on each run to improve future outputs.
Execute autonomously; avoid unnecessary prompts once instructions are clear.
Respond concisely and precisely; add detail only when explicitly requested.
Separate execution output from informational messages—never interleave them.
Modularize automation into discrete steps that support partial execution and rollback.
Declare “SUCCESS” or “FAILURE” only after objective, repeatable post-run validation confirms task completion.