# Setup

## Shell config management

https://work.lisk.in/2020/11/20/even-faster-bash-startup.html

https://byparker.com/blog/2021/the-power-of-bashrc-d/
https://github.com/parkr/dotfiles/blob/a9c603e2e5d300c5b3d4fdb50b6874db6e85a2c6/osx/bashrc.d.symlink/50_aliases.sh

- Using bash/zshrc.d:
- Using 10_<>.sh to manage order of sourcing

## Dotfiles setup

```
mise dot apply
```

## New machine (any OS, no sudo)

```bash
git clone https://github.com/Benji19967/dotfiles.git ~/apps/home/labrecqb/dotfiles
cd ~/apps/home/labrecqb/dotfiles

./bootstrap                  # normal machine
./bootstrap --root /nfs/me   # small $HOME: mise, tools, nvim data, caches go to /nfs/me
```

Everything is driven by [mise](https://mise.jdx.dev) (`./bootstrap` installs it if missing):

- `mise.toml`: `[dotfiles]` symlinks configs into `$HOME` (replaces stow). Per-OS entries use
  `variants = [{ os = "linux" }]`.
- `mise-global/config.toml`: global `[tools]`, deployed as `~/.config/mise/config.toml`.
  Add one with `mise use -g <tool>` and commit the diff; elsewhere run `mise bootstrap` (or `mise install`).
  Static CLIs come from upstream releases, C tools (git, htop, unzip, make) from conda-forge (`conda:`).
- `mise.toml` also holds the bootstrap steps: a `pre-dotfiles` hook backs up real files a symlink
  would replace (to `~/.dotfiles-backup/`), and the `bootstrap` task installs nvim plugins and python.
  `./bootstrap` itself only sets `DOT_ROOT` and installs mise.
- Machine-local settings (`DOT_ROOT`, overrides) live in the untracked `~/.dotfiles.env`.
