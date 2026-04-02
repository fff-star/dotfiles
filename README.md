# 🛠️ Dotfiles | ThinkPad T480s

A minimal, keyboard-driven Wayland setup. Managed by [chezmoi](https://www.chezmoi.io/).

## 🖥️ Core Stack
* **WM:** [niri](https://github.com/niri-wm/niri) (Scrollable-tiling compositor)
* **Shell:** Zsh (via [Zimfw](https://github.com/zimfw/zimfw)) + [Dank Material Shell](https://github.com/AvengeMedia/DankMaterialShell)
* **Terminal:** [foot](https://codeberg.org/dnkl/foot) & [ghostty](https://github.com/ghostty-org/ghostty)
* **Editors:** [Neovim](https://github.com/neovim/neovim) (Full Lua config) & [Zed](https://zed.dev/)
* **Browsing:** [qutebrowser](https://qutebrowser.org/) (Vim-like)
* **Media:** MPD + ncmpcpp (High-fidelity local audio)
* **Reading:** Zathura (Essential for PDF/LaTeX)

## 🚀 Quick Start
To deploy these configs on a new machine:

- github:
``` bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/fff-star/dotfiles.git
```

- codeberg:
``` bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://codeberg.org/fff-star/dotfiles.git
```

> [!CAUTION]
> This command will overwrite existing configuration files in your $HOME directory. Back up your files before proceeding!
