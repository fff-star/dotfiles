# 🛠️ Dotfiles

Personal dotfiles for a minimal, keyboard-driven Wayland setup, managed by [chezmoi](https://www.chezmoi.io/).

## 🖥️ Core Stack

- **WM:** [niri](https://niri-wm.github.io/niri/index.html) — scrollable-tiling compositor
- **Shell:** Zsh ([Zimfw](https://github.com/zimfw/zimfw)) + Bash + [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Terminal:** [Ghostty](https://ghostty.org/) & [foot](https://codeberg.org/dnkl/foot)
- **Editors:** [Neovim](https://neovim.io/) (Lua config) & [Zed](https://zed.dev/)
- **Browser:** [qutebrowser](https://qutebrowser.org/)
- **Media:** MPD + ncmpcpp
- **PDF/LaTeX:** Zathura
- **Multiplexer:** tmux (catppuccin)

## 🚀 Quick Start

Bootstrap chezmoi and apply the configs, choosing whichever mirror you prefer:

**GitHub**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/fff-star/dotfiles.git
```

**Codeberg**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://codeberg.org/fff-star/dotfiles.git
```

> [!CAUTION]
> `--apply` overwrites existing files in your `$HOME`. Back up first!

> [!NOTE]
> These are personal configs — a few files contain machine-specific absolute paths (e.g. `/home/fff`).
> If your username differs, run `chezmoi init` **without** `--apply`, review or convert the affected files to chezmoi templates, then run `chezmoi apply`.

## 🔄 Updates

After the initial setup, pull changes from the repo and apply them with:

```bash
chezmoi update
```

## 📁 What's Managed

Shell (`.zshrc`, `.bashrc`, `.p10k.zsh`) · niri (incl. DMS) · Ghostty · foot · Neovim · Zed · qutebrowser · MPD/ncmpcpp · Zathura · tmux · misc user scripts
