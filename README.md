# NeoVimcent

## Introduction

My Neovim configuration. Created from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/).

### Features

- Integrated Snacks and Mini plugins
- Integrated LSP with Mason
- Integrated Lazy plugin
- Integrated Git environment with LazyGit
- Code autocompletion and autoformatting
- Catppuccin theme and other nice things for extra fanciness

## Installation

### Install Neovim

NeoVimcent targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation),
  [fd-find](https://github.com/sharkdp/fd#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

### Install NeoVimcent

> [!NOTE]
> Backup your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Clone the repo

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/conradthegray/nvim-config "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```sh
git clone https://github.com/conradthegray/nvim-config "%localappdata%\nvim"
```

If you're using `powershell.exe`

```sh
git clone https://github.com/conradthegray/nvim-config "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

## Plugins

Place config files for plugins in the `lua/plugins` folder.

There is also `lua/custom` folder for plugins specific for that machine (like work laptop, etc.) that won't tracked by Git.
