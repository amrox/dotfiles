# Zsh setup — design

**Date:** 2026-05-05
**Status:** Approved, ready for implementation

## Goals

- Track zsh configuration in this dotfiles repo (currently untracked).
- Single config that works on both macOS and Linux without per-machine forks.
- Faster cold-start than the current oh-my-zsh setup (~900ms cold).
- Stay consistent with this repo's minimalism conventions.
- Support per-machine overrides via untracked local files.

## Non-goals

- A `.zshenv`. Not needed yet; can add if a non-interactive script requires it.
- A `.zlogin`. Almost never useful.
- Reconciling the divergent zsh state on the user's other machine. That's a follow-up; this spec defines the canonical config.
- Migrating PATH-set scripts from `~/.zprofile` of the other machine.

## Plugin manager: antidote

Replaces oh-my-zsh.

- One submodule (`mattmc3/antidote`) at `zsh/.zsh/antidote/`. Mirrors the `tmux/tpm` pattern: submodule the manager, let it manage everything else.
- Antidote loads plugins from a versioned `.zsh_plugins.txt`. Loaded copies live in `~/.cache/antidote/` (outside the dotfiles tree).
- Cold-start target: ≤100ms (vs ~900ms today).

## File layout

```
zsh/
├── .zshrc                 # interactive shell init
├── .zprofile              # login shell init
├── .zsh_plugins.txt       # antidote plugin list
└── .zsh/
    └── antidote/          # submodule → mattmc3/antidote
```

When stowed:

- `zsh/.zshrc` → `~/.zshrc`
- `zsh/.zprofile` → `~/.zprofile`
- `zsh/.zsh_plugins.txt` → `~/.zsh_plugins.txt`
- `zsh/.zsh/antidote/` → `~/.zsh/antidote/`

## `.zsh_plugins.txt`

```
ohmyzsh/ohmyzsh path:plugins/gitfast
ohmyzsh/ohmyzsh path:plugins/docker
ohmyzsh/ohmyzsh path:plugins/python
ohmyzsh/ohmyzsh path:plugins/brew
ohmyzsh/ohmyzsh path:plugins/fzf
MichaelAquilina/zsh-you-should-use
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
```

Antidote loads in file order. `zsh-syntax-highlighting` must remain last.

The `sd` plugin is intentionally omitted (origin unconfirmed; can be added later).

## `.zshrc` structure

About 50 lines, in this order:

1. Profiling stub (commented; uncomment top + bottom to measure with `zprof`).
2. History settings — `HISTSIZE`, `SAVEHIST`, `HISTFILE`, `setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY HIST_REDUCE_BLANKS`.
3. Antidote bootstrap — `source ~/.zsh/antidote/antidote.zsh && antidote load ~/.zsh_plugins.txt`.
4. Aliases — git (`gsub`, `gdmerged`, `gcountall`), misc (`whatismyip`, `whitespace`).
5. Tool integrations, each guarded by `command -v`: `mise activate`, `atuin init`, `starship init`.
6. `TERM` workaround for `tmux-256color` → `screen-256color`.
7. Claude wrapper — `claude() { env -u DO_NOT_TRACK command claude "$@"; }`.
8. OS-specific block — `if [[ "$OSTYPE" == darwin* ]]`: iTerm shell integration, `love` alias.
9. Source `~/.zshrc.local` if present (machine-specific overrides).
10. Profiling tail (commented).

No eza alias block (user does not use eza).

## `.zprofile` structure

```zsh
export DO_NOT_TRACK=1

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

path=("$HOME/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" $path)

[[ -f "$HOME/.orbstack/shell/init.zsh" ]] && source "$HOME/.orbstack/shell/init.zsh"

[[ -d "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" ]] && \
  path=("$HOME/Library/Application Support/JetBrains/Toolbox/scripts" $path)

[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
```

## File-type guidance (the `.zshrc` vs `.zprofile` rule)

For future maintenance:

| File | Runs | Belongs there |
|---|---|---|
| `.zshenv` | every zsh invocation including scripts | env vars scripts need; keep minimal |
| `.zprofile` | login shells, once per session | PATH, env setup, `brew shellenv`, OrbStack, set-once tools |
| `.zshrc` | every interactive shell | aliases, prompt, plugins, completion, keybinds |

Tool docs default to `.zshrc` because it takes effect immediately in the current session, but path/env setup actually belongs in `.zprofile` to avoid re-running per pane.

## Cross-platform strategy

- All darwin-only paths are guarded with `[[ -x ... ]]` / `[[ -d ... ]]` / `[[ -f ... ]]` and no-op on Linux.
- Linuxbrew path is also guarded; no-ops on macOS.
- OS-specific blocks in `.zshrc` use `[[ "$OSTYPE" == darwin* ]]`.
- For things that don't fit either pattern, use `~/.zshrc.local` or `~/.zprofile.local`.

## Migration

On the current machine:

1. Create `zsh/` package with all files above.
2. Add antidote submodule at `zsh/.zsh/antidote/`.
3. Back up existing `~/.zshrc` → `~/.zshrc.backup` and `~/.zprofile` → `~/.zprofile.backup`.
4. Delete the originals so stow can symlink.
5. `cd ~/.dotfiles && stow zsh`.
6. Open a new terminal. Antidote auto-bootstraps on first run (one slow start).
7. Verify plugins load and behavior matches expectation.
8. Compare cold-start time vs the 0.90s baseline.
9. Once verified, delete the `.backup` files.

For the other machine (divergent state): out of scope. When pulled there, the user resolves the conflict like any normal merge — the canonical config is now the tracked one.

## Updating CLAUDE.md and README

- README: add a `### zsh` section.
- CLAUDE.md: move zsh out of "Pending" into "Active packages" with a one-line description.
