<p align="center">
  <img src="./doc/img/vide_logo.png"/>
</p>

Welcome to my personalized Neovim configuration! This configuration is tailored
primarily for DevOps tasks but can also be utilized by developers working with
languages like Bash, Go, JSON, Python, Terraform, TypeScript, and more.

I've aimed to streamline the installation process by creating installation
scripts for your preferred distributions (you can even test it on Docker
images).

![dashboard](./doc/img/plug_dashboard.png)
![neotree-symbolsoutline](./doc/img/plug_neotree_symbolsoutline.png)
![telescope](./doc/img/plug_telescope.png) ![git](./doc/img/plug_lazygit.png)

## 🎁 Features

- **DevOps-Centric:** This Neovim setup is optimized for DevOps workflows,
  enhancing your efficiency in tasks related to infrastructure, automation, and
  more.
- **Developer-Friendly:** Even if you're a developer working with various
  programming languages such as Bash, Go, JSON, Nix, Python, Terraform,
  TypeScript, etc., this configuration has you covered.

## 🛒 Plugins

- ⚙️ **Core**
  - A modern plugin manager for Neovim
    [Lazy](https://github.com/folke/lazy.nvim)
  - Icons package
    [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - Folder & code visualiser
    [neotree](https://github.com/nvim-neo-tree/neo-tree.nvim),
    [symbols-outline](https://github.com/simrat39/symbols-outline.nvim)
  - Completion engine [cmp](https://github.com/hrsh7th/nvim-cmp)
  - Notification [noice](./doc/plugins.md#noice)
  - Find, Filter, Preview, Pick
    [telescope](https://github.com/nvim-telescope/telescope.nvim),
    [spectre](./doc/plugins.md#spectre)
  - Improve the default vim.ui interfaces
    [dressing](https://github.com/stevearc/dressing.nvim)
- 🖥️ **Appearance**
  - A clean, dark Neovim colorscheme
    [tokyonight](https://github.com/folke/tokyonight.nvim)
  - A vim-startify like [dashboard](https://github.com/nvimdev/dashboard-nvim)
  - Status line & tabline
    [bufferline](https://github.com/akinsho/bufferline.nvim),
    [lualine](./doc/plugins.md#lualine)
  - Easily create and manage predefined window layouts
    [edgy](./doc/plugins.md#edgy)
- ⌨️ **IDE**
  - Key bindings that stick [which-key](https://github.com/folke/which-key.nvim)
  - Git integration for buffers [gitsigns](./doc/plugins.md#gitsigns)
  - Indent guides [indent_blankline](./doc/plugins.md#indent_blankline)
  - LSP, diagnostic, linting [mason](./doc/plugins.md#mason),
    [treesitter](https://github.com/nvim-treesitter/nvim-treesitter),
    [trouble](https://github.com/folke/trouble.nvim)
  - Keymap popup [which-key](./doc/plugins.md#which-key)
  - Preview markdown result
    [mardown-preview](./doc/plugins.md#markdown-preview),

## 💬 **Language support**

| Language       | Hightlght | Format | Diagnostic | completion | Plugins                                           |
| -------------- | --------- | ------ | ---------- | ---------- | ------------------------------------------------- |
| bash           | ✅        | ✅     | ✅         | 🔳         | shellharden, shellcheck                           |
| deno           | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| Dockerfile     | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| go             | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| json           | ✅        | ✅     | ✅         | 🔳         | fixjson, jsonlint                                 |
| lua            | ✅        | ✅     | ✅         | 🔳         | luacheck, selene, stylua                          |
| markdown       | ✅        | ✅     | ✅         | 🔳         | markdownlint, marksman, deno_fmt                  |
| nix            | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| python         | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| terraform      | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| typescript     | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| vim            | 🔳        | 🔳     | 🔳         | 🔳         | TODO                                              |
| diagram        | ❌        | ❌     | ❌         | 🔳         | venn                                              |
| markdown table | ❌        | ✅     | ❌         | 🔳         | [vim-table-mode](./doc/plugins.md#vim-table-mode) |

## 🎮 Try

### Docker

```shell
git clone https://github.com/badele/vide.git ~/.config/vide
cd ~/.config/vide
install/ubuntu build # ~ 5 min
install/ubuntu run
/check.sh
nvim
```

### Distribution

```shell
git clone https://github.com/badele/vide.git ~/.config/vide
[Optional] install/ubutu
NVIM_APPNAME="vide" nvim
```

## ⛏️ Installation

You can use this configuration with neovim >= 0.8.0

If you need install some distribution dependencies use `install/<distribname>`
script

Supported distributions list:

- Ubuntu
- TODO: Archlinux
- TODO: Nixos

```shell
mv ~/.config/nvim ~/.config/nvim.bak-$(date +%s)
git clone https://github.com/badele/vide.git ~/.config/nvim
[Optional] install/archlinux
./check.sh
nvim
```

### ✅ TODO

- **vide**

  - [ ] Define `lazy` & `event` option for all plugins
  - [ ] Add markdown preview keybinding on <leader>mm or <leader>mp

- search plugins for :

  - [ ] todo or org alternative
  - [ ] [vim-sops](https://github.com/jsecchiero/vim-sops/tree/main)

- try
  - [ ] vimwiki
  - [ ] [incline](https://github.com/b0o/incline.nvim)

## Credits

Many snippets come from the following projects, thanks to the contributors of
these projects

- [lazyvim](https://github.com/LazyVim/LazyVim)
- [lunarvim](https://github.com/lunarvim/lunarvim)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
