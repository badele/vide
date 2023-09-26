<p align="center">
  <img src="./doc/img/vide_logo.png"/>
</p>

Welcome to my personalized Neovim configuration! This configuration is tailored
primarily for DevOps tasks but can also be utilized by developers working with
languages like Bash, Go, JSON, Python, Terraform, TypeScript, and more.

I've aimed to streamline the installation process by creating installation
scripts for your preferred distributions (you can even test it on Docker
images).

<!--toc:start-->

- [🎁 Features](#🎁-features)
- [🛒 Plugins](#🛒-plugins)
- [💬 **Language support**](#💬-language-support)
  - [🏆 Fully supported](#🏆-fully-supported)
  - [🌓 Partily supported](#🌓-partily-supported)
- [⌨️ keybinding](#️-keybinding)
- [🎮 Try](#🎮-try)
  - [Try on docker image](#try-on-docker-image)
  - [Try on your distribution](#try-on-your-distribution)
    - [1) Select nix installation from your distribution](#1-select-nix-installation-from-your-distribution)
    - [2) Configure nix](#2-configure-nix)
- [⛏️ Installation](#️-installation)
- [💻](#💻)
  - [✔️ TODO](#todo)
- [Credits](#credits)
<!--toc:end-->

![dashboard](./doc/img/plug_dashboard.png)
![neotree-symbolsoutline](./doc/img/plug_neotree_symbolsoutline.png)
![telescope](./doc/img/plug_telescope.png) ![git](./doc/img/plug_lazygit.png)

## 🎁 Features

- **DevOps-Centric:** This Neovim setup is optimized for DevOps workflows,
  enhancing your efficiency in tasks related to infrastructure, automation, and
  more.
- **Developer-Friendly:** Even if you're a developer working with various
  programming languages such as Bash, Deno, Go, JSON, Nix, Python, Terraform,
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
  - Notification [noice](https://github.com/folke/noice.nvim)
  - Find, Filter, Preview, Pick
    [telescope](https://github.com/nvim-telescope/telescope.nvim),
    [spectre](https://github.com/nvim-pack/nvim-spectre)
  - Improve the default vim.ui interfaces
    [dressing](https://github.com/stevearc/dressing.nvim)
- 🖥️ **Appearance**
  - A clean, dark Neovim colorscheme
    [tokyonight](https://github.com/folke/tokyonight.nvim)
  - A vim-startify like [dashboard](https://github.com/nvimdev/dashboard-nvim)
  - Status line & tabline
    [bufferline](https://github.com/akinsho/bufferline.nvim),
    [lualine](https://github.com/nvim-lualine/lualine.nvim)
  - Easily create and manage predefined window layouts
    [edgy](https://github.com/folke/edgy.nvim)
- 🪟 **IDE**
  - Key bindings that stick [which-key](https://github.com/folke/which-key.nvim)
  - Git integration for buffers
    [gitsigns](https://github.com/lewis6991/gitsigns.nvim),
    [neogit](https://github.com/NeogitOrg/neogit)
  - Indent guides
    [indent_blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
  - LSP, diagnostic, linting
    - [lspconfig](https://github.com/neovim/nvim-lspconfig),
    - [mason](https://github.com/williamboman/mason.nvim),
    - [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
    - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter),
    - [trouble](https://github.com/folke/trouble.nvim)
    - [formatter.nvim](https://github.com/mhartington/formatter.nvim)
    - [nvim-lint](https://github.com/mfussenegger/nvim-lint),
  - Keymap popup [which-key](https://github.com/folke/which-key.nvim)
  - Preview markdown result
    [mardown-preview](https://github.com/iamcco/markdown-preview.nvim),
- ⛏️ External
  - Conventional commits
    [commitizen](https://github.com/commitizen-tools/commitizen)

## 💬 **Language support**

You can enable or disable support for a language by editing the `flake.nix`
file. The below table show the languages fully supporter (LSP, highlighting,
format, lint/diagnostic, completion, action).

### 🏆 Fully supported

| Language   | LSP | HL  | FO  | Lint | cmp | CA  | Plugins                            |
| ---------- | --- | --- | --- | ---- | --- | --- | ---------------------------------- |
| deno       | ✔️   | ✔️   | ✔️   | ✔️    | ✔️   | ✔️   | lspconfig (denols)                 |
| lua        | ✔️   | ✔️   | ✔️   | ✔️    | ✔️   | ✔️   | lspconfig (lua_ls)                 |
| markdown   | ✔️   | ✔️   | ✔️   | ✔️    | ✔️   | ✔️   | lspconfig (marksman),efm(prettier) |
| nix        | ✔️   | ✔️   | ✔️   | ✔️    | ✔️   | ✔️   | lspconfig (nixd, nil_ls, rnix      |
| scala      | ✔️   | ✔️   | ✔️   | ✔️    | ✔️   | ✔️   | lspconfig (metals)                 |
| typescript | ✔️   | ✔️   | ✔️   | ✔️    | ✔️   | ✔️   | lspconfig (denols)                 |


### 🌓 Partily supported

| Language       | LSP | HL  | FO  | Lint | cmp | CA  | Plugins                           |
| -------------- | --- | --- | --- | ---- | --- | --- | --------------------------------- |
| ansible        | ✔️   | ✔️   | ❌  | ✔️    | ❌  | 🔳  | ansiblels, ansible-lint           |
| diagram        | 🔳  | ❌  | ❌  | ❌   | 🔳  | 🔳  | venn                              |
| dockerfile     | 🔳  | 🔳  | 🔳  | 🔳   | 🔳  | 🔳  | TODO                              |
| docker-compose | 🔳  | 🔳  | 🔳  | 🔳   | 🔳  | 🔳  | TODO                              |
| go             | 🔳  | 🔳  | 🔳  | 🔳   | 🔳  | 🔳  | TODO                              |
| json           | ✔️   | ✔️   | ✔️   | ✔️    | 🔳  | 🔳  | lspconfig(jsonls), efm(fixjson)   |
| lua            | ✔️   | ✔️   | ✔️   | ✔️    | 🔳  | 🔳  | luacheck, selene, stylua          |
| makefile       | 🔳  | ✔️   | ❌  | ✔️    | ❌  | 🔳  | checkmake                         |
| markdown table | 🔳  | ❌  | ✔️   | ❌   | 🔳  | 🔳  | vim-table-mode                    |
| python         | ✔️   | 🔳  | 🔳  | 🔳   | 🔳  | 🔳  | TODO                              |
| shell          | ✔️   | ✔️   | ❌  | ✔️    | ✔️   | 🔳  | lspconfig(bashls)                 |
| terraform      | ✔️   | ✔️   | ✔️   | 🔳   | ✔️   | 🔳  | lspconfig(terraform, terraform-ls |
| vim            | 🔳  | 🔳  | 🔳  | 🔳   | 🔳  | 🔳  | TODO                              |
| yaml           | ✔️   | ✔️   | ❌  | ✔️    | ❌  | ❌  | efm(yamlint,prettier)             |

**Legend :**
`LSP-Language Server Protocol / HL-Highlight / FO-Format / CA-Code Action`

## ⌨️ keybinding

Main keybinding with `<leader>` key :

| Key   | Category  |
| ----- | --------- |
| **c** | Code      |
| **f** | Find/File |
| **g** | Goto      |
| **m** | Misc      |
| **s** | Search    |
| **t** | Table     |
| **u** | User      |
| **!** | Terminal  |

## 🎮 Try

You can use this configuration with neovim >= 0.8.0

If you need install some distribution dependencies use `install/<distribname>`
script

Supported distributions list:

- archlinux
- debian
- fedora
- nixos
- ubuntu

### Try on docker image

```shell
git clone https://github.com/badele/vide.git ~/.config/vide
cd ~/.config/vide
make docker-run DISTRIB=<distribname>
make check
nvim
```

### Try on your distribution

Before installing vide in your distribution, you must install & configure nix.

#### 1) Select nix installation from your distribution

| Distribution | Installation command                            |
| ------------ | ----------------------------------------------- |
| archlinux    | `pacman -S git nix`                             |
| debian       | `apt-get git nix`                               |
| fedora       | `dnf install git xz` && manual nix installation |
| nixos        | no need installation                            |
| ubuntu       | `apt-get git nix`                               |

**Manual nix installation :**
`curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes`

#### 2) Configure nix

```shell
echo "extra-experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

Preserve your current nvim configuration

```shell
git clone https://github.com/badele/vide.git ~/.config/vide
cd ~/.config/vide
nix develop
make check
make try-nvim
```

## ⛏️ Installation

**Warning**: That replace your current nvim configuration, your current
configuration is backuped

```shell
mv ~/.config/nvim ~/.config/nvim.bak-$(date +%s)
git clone https://github.com/badele/vide.git ~/.config/nvim
cd ~/.config/nvim
nix develop
make check
nvim
```

## 💻

Available commands

```text
check          Check requirements installation
distrib-list   List supported distribution
docker-build   Build <DISTRIB> docker image
docker-run     Run <DISTRIB> docker image
help           This help
try-nvim       Try nvim without update your current nvim configuration
```

### ✔️ TODO

- **vide**

  - [ ] Define `lazy` & `event` option for all plugins
  - [ ] Add markdown preview keybinding on `<leader>mm` or `<leader>mp`

- search plugins for :

  - [ ] todo or org alternative
  - [ ] [vim-sops](https://github.com/jsecchiero/vim-sops/tree/main)

- try
  - [ ] [refactoring with nulls](ThePrimeagen/refactoring)
  - [ ] neorg
  - [ ] ALE
  - [ ] vimwiki
  - [ ] [incline](https://github.com/b0o/incline.nvim)

## Credits

Many snippets come from the following projects, thanks to the contributors of
these projects

- [lazyvim](https://github.com/LazyVim/LazyVim)
- [lunarvim](https://github.com/lunarvim/lunarvim)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
