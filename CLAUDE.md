# CLAUDE.md

Personal dotfiles managed with [GNU stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is one stow package. The directory's contents mirror
`$HOME`, so `nvim/.config/nvim/init.lua` symlinks to `~/.config/nvim/init.lua`
when you `stow nvim`. Files at the package root (e.g. `vim/.vimrc`) symlink
to `$HOME` directly.

## Active packages

- **vim/** — Truly minimal. Five-line `.vimrc` that sources Vim's built-in
  `defaults.vim`. No plugin manager, no plugins.
- **nvim/** — Light Neovim config on lazy.nvim. Built-in LSP for `lua_ls` and
  `bashls`; `vim-fugitive` and `vim-dispatch`. No treesitter, no telescope,
  no completion plugin (kept removable on purpose). Plays nicely with the
  VSCode Neovim extension via `vim.g.vscode` checks.
- **tmux/** — tpm-managed. Synchronized output enabled.
- **git/** — Shared `.gitconfig_shared` plus globals; users include it from
  their machine-local `~/.gitconfig`.
- **direnv/** — Auto-detects devbox/nix/`.envrc.private`.
- **system-setup/** — Not a stow package; one-off macOS bootstrap scripts.

## Conventions

- Commit messages: `<package>: <imperative description>`. Lowercase. Body
  optional but used when the *why* isn't obvious from the diff.
- Each commit stays scoped to one package or one concern.
- Submodules: only `tmux/.tmux/plugins/tpm`. Don't add others without
  reason — vendoring or upstream tooling is usually cleaner.
- Nothing tracked should hardcode `/Users/amrox/...`. Generated config that
  does (e.g. `.luarc.json`) is gitignored at the repo root.

## Pending

- **zsh** is not yet tracked. Setup has divergent state across machines and
  needs reconciliation before adoption.

## Editor philosophy

The user is not a Neovim primary driver. Keep the nvim config lean — resist
adding LSPs, completion engines, or feature plugins unless asked. Vim is
even more minimal by intent: do not reintroduce a plugin manager.
