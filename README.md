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

In your local `~/.gitconfig` do this:

```
[include]
        path = ~/.gitconfig_shared
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

### system-setup

Scripts general system configuration. These are not really "dotfiles", but this
seemed like a good enough place for now.

### License

MIT
