# zsh

Zsh configuration for this dotfiles repo. Plugin manager: [antidote](https://github.com/mattmc3/antidote).

## File-type model

Knowing which file an entry belongs in is the trickiest part of zsh config:

| File | Runs | Belongs there |
|---|---|---|
| `.zshenv` | every zsh invocation including scripts | env vars scripts need; keep minimal |
| `.zprofile` | login shells, once per session | PATH, env setup, `brew shellenv`, OrbStack, anything to set up once |
| `.zshrc` | every interactive shell | aliases, prompt, plugins, completion, key bindings |
| `.zlogin` | after `.zshrc` for login shells | almost never used |

Tool docs default to `.zshrc` because it takes effect immediately in your current session, but path/env setup actually belongs in `.zprofile` to avoid re-running per pane.

## Cross-platform strategy

Single config that works on macOS and Linux. The strategy:

- All darwin-only paths are guarded with `[[ -x ... ]]` / `[[ -d ... ]]` / `[[ -f ... ]]` and no-op on Linux.
- Linuxbrew path is also guarded; no-ops on macOS.
- OS-specific blocks in `.zshrc` use `[[ "$OSTYPE" == darwin* ]]`.
- For things that don't fit either pattern (machine-specific paths, work-only tools), use `~/.zshrc.local` or `~/.zprofile.local`. These are untracked.

## How to add a new tool

1. Decide: env/PATH setup → `.zprofile`. Interactive (prompt, completion, aliases) → `.zshrc`.
2. If the tool may not be installed on every machine, guard with `command -v <tool> &>/dev/null && ...` (`.zshrc`) or `[[ -x <path> ]] && ...` (`.zprofile`).
3. If it's machine-specific (work-only, paid app), put it in `~/.zshrc.local` / `~/.zprofile.local` instead of the tracked file.
4. If it's a zsh plugin: add a line to `.zsh_plugins.txt` and run `antidote update`.

## Plugins

Plugins are listed in `.zsh_plugins.txt`, loaded by antidote in file order. `zsh-syntax-highlighting` must remain last — it wraps the prompt redraw and breaks if anything sources after it.

oh-my-zsh plugins are referenced as `ohmyzsh/ohmyzsh path:plugins/<name>`. Antidote does a sparse checkout, so you get the plugin without omz's framework overhead.

## Profiling startup time

Uncomment the `zmodload zsh/zprof` line at the top of `.zshrc` AND the `zprof` line at the bottom, then open a new shell. Re-comment after.

For a quick total: `time zsh -i -c exit`.
