# Setup

## Dotfiles setup

```
mise dot apply
```

## New machine (any OS, no sudo)

Everything is driven by [mise](https://mise.jdx.dev) (`./bootstrap` installs it if missing):

```bash
git clone https://github.com/Benji19967/dotfiles.git ~/apps/home/labrecqb/dotfiles
cd ~/apps/home/labrecqb/dotfiles

./bootstrap                  # normal machine
./bootstrap --root /nfs/me   # small $HOME: mise, tools, nvim data, caches go to /nfs/me
```


- `mise.toml`: 
  - `[dotfiles]` symlinks configs into `$HOME` (replaces stow). 
    - Per-OS entries use `variants = [{ os = "linux" }]`.
- `mise-global/config.toml`: 
  - global `[tools]`, deployed as `~/.config/mise/config.toml`.
  - Add one with `mise use -g <tool>` and commit the diff; elsewhere run `mise bootstrap` (or `mise install`).
  - Static CLIs come from upstream releases, C tools (git, htop, unzip, make) from conda-forge (`conda:`).
- Machine-local settings (`DOT_ROOT`, overrides) live in the untracked `~/.dotfiles.env`.
