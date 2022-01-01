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

### vim-minimal

Basic sane settings to make vim act modernly and try to be smart about identation.

### system-setup

Scripts general system configuration. These are not really "dotfiles", but this
seemed like a good enough place for now.

### License

MIT
