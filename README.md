# amrox's dotfiles

Settings ("dotfiles") for various programs.

These are meant to be installed with [GNU stow](https://www.gnu.org/software/stow/).

## Usage

Clone this repo:

```
git clone https://github.com/amrox/dotfiles.git ~/.dotfiles
```

Install a particular group of settings, for example:

```
cd ~/.dotfiles
stow tmux
```

## Notes

### git

`stow git` symlinks `~/.gitconfig_shared` and `~/.gitignore_global`. Keep
`~/.gitconfig` as a *real* file — many tools (`gh auth login`, `git lfs
install`, etc.) auto-write to it, and you don't want those host-specific
edits landing in the tracked repo. Adding to `.gitconfig_shared` should
be a deliberate action.

In your local `~/.gitconfig`, include the shared file plus your email
and any other machine-specific bits:

```
[include]
    path = ~/.gitconfig_shared

[user]
    email = you@example.com
```

### vim

A truly minimal `.vimrc`: sources Vim's built-in `defaults.vim`, sets
mouse and clipboard, and points netrw history at `~/.cache/vim`. No
plugin manager, no plugins.

### nvim

Neovim config built around [lazy.nvim](https://github.com/folke/lazy.nvim).
Light footprint: built-in LSP for `lua_ls` and `bashls`, plus `vim-fugitive`
and `vim-dispatch`. Plays nicely with the [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim)
extension via `vim.g.vscode` checks.

### zsh

Antidote-based zsh setup that works on macOS and Linux. See [`zsh/README.md`](zsh/README.md)
for the file-type model (`.zshenv`/`.zprofile`/`.zshrc`) and the
cross-platform strategy.

### atuin

Config for [atuin](https://atuin.sh) shell-history sync. Currently all
defaults; tracked so any tweaks are captured.

### system-setup

Scripts general system configuration. These are not really "dotfiles", but this
seemed like a good enough place for now.

### License

MIT
