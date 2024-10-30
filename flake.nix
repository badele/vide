{
  description = "A Nix-flake-based vide project development environment";

  # 'github:NixOS/nixpkgs/79a13f1437e149dc7be2d1290c74d378dad60814' (2024-02-03)
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  # inputs.nixpkgs.url = "path:/home/badele/ghq/github.com/badele/fork-nixpkgs";

  outputs = { self, nixpkgs, }:
    let
      ###########################################################################
      # Lanuages Activation
      ###########################################################################
      ansible_support = true;
      bash_support = true;
      d2_support = true;
      deno_support = true;
      dockerfile_support = true;
      javascript_support = true;
      json_support = true;
      ledger_support = true;
      tex_support = true;
      lua_support = true;
      make_support = true;
      markdown_support = true;
      nix_support = true;
      openscad_support = true;
      python_support = true;
      scala_support = true;
      terraform_support = true;
      typescript_support = true;
      yaml_support = true;

      supportedSystems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems (system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true; # For terraform
            };
          });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }:
        let
          ###########################################################################
          # Lanuages support
          ###########################################################################
          ansible_packages = with pkgs; [ ansible-lint ];

          bash_packages = with pkgs; [
            nodePackages.bash-language-server
            shellcheck
            shfmt
          ];

          d2_packages = with pkgs; [ d2 ];

          deno_packages = with pkgs; [ deno ];

          dockerfile_packages = with pkgs;
            [ nodePackages.dockerfile-language-server-nodejs ];

          javascript_packages = with pkgs; [ nodePackages.eslint ];

          json_packages = with pkgs; [
            vscode-langservers-extracted
            nodePackages.fixjson
            nodePackages.jsonlint
          ];

          ledger_packages = with pkgs; [ ledger hledger ];

          # Latex
          tex_packages = with pkgs; [
            (texlive.combine {
              inherit (texlive)
                scheme-medium tabularray ninecolors msg lipsum pgf;
            })
            pplatex
            texlab
            zathura
          ];

          lua_packages = with pkgs; [
            # LSP
            lua-language-server

            # Formater
            stylua
            luaformatter

            luajitPackages.luacheck
            selene
          ];

          make_packages = with pkgs; [ checkmake ];

          markdown_packages = with pkgs; [
            marksman
            nodePackages.markdownlint-cli
            python311Packages.mdformat
          ];

          nix_packages = with pkgs; [
            # Formater
            alejandra
            deadnix
            nixd
            nil
            nixfmt
            nixpkgs-fmt
            statix
          ];

          openscad_packages = with pkgs; [ openscad openscad-lsp clang ];

          python_packages = with pkgs; [
            ruff
            (python3.withPackages (ps:
              with ps; [
                pycodestyle
                pydocstyle
                pylint
                ruff-lsp
                mypy
                vulture
              ]))
          ];

          scala_packages = with pkgs; [ sbt metals ];

          terraform_packages = with pkgs; [ terraform terraform-ls ];

          typescript_packages = with pkgs; [ deno ];

          yaml_packages = with pkgs; [ yaml-language-server ];
        in
        with pkgs;
        with lib; {
          default = pkgs.mkShell {
            shellHook = ''
                export VIDE_ANSIBLE_SUPPORT=${boolToString ansible_support}
              export VIDE_BASH_SUPPORT=${boolToString bash_support}
              export VIDE_D2_SUPPORT=${boolToString d2_support}
              export VIDE_DENO_SUPPORT=${boolToString deno_support}
              export VIDE_DOCKERFILE_SUPPORT=${boolToString dockerfile_support}
              export VIDE_JAVASCRIPT_SUPPORT=${boolToString javascript_support}
              export VIDE_JSON_SUPPORT=${boolToString json_support}
              export VIDE_TEX_SUPPORT=${boolToString tex_support}
              export VIDE_LUA_SUPPORT=${boolToString lua_support}
              export VIDE_LEDGER_SUPPORT=${boolToString ledger_support}
              export VIDE_MAKE_SUPPORT=${boolToString make_support}
              export VIDE_MARKDOWN_SUPPORT=${boolToString markdown_support}
              export VIDE_NIX_SUPPORT=${boolToString nix_support}
              export VIDE_PYTHON_SUPPORT=${boolToString python_support}
              export VIDE_OPENSCAD_SUPPORT=${boolToString openscad_support}
              export VIDE_SCALA_SUPPORT=${boolToString scala_support}
              export VIDE_TERRAFORM_SUPPORT=${boolToString terraform_support}
              export VIDE_TYPESCRIPT_SUPPORT=${boolToString typescript_support}
              export VIDE_YAML_SUPPORT=${boolToString yaml_support}
            '';

            packages = with pkgs;
              [
                # Conventional commit
                cocogitto

                # vide project requirements
                pre-commit

                # neovim and plugins build requirements
                cargo
                cmake
                curl
                git
                ncurses
                neovim
                nodejs
                unzip
                yarn

                # Need by plugins
                fd
                lazygit
                ripgrep
                tree-sitter
                xclip

                # Misc language
                # efm-langserver
                nodePackages.prettier
              ] ++ optionals ansible_support ansible_packages
              ++ optionals bash_support bash_packages
              ++ optionals d2_support d2_packages
              ++ optionals deno_support deno_packages
              ++ optionals dockerfile_support dockerfile_packages
              ++ optionals javascript_support javascript_packages
              ++ optionals json_support json_packages
              ++ optionals ledger_support ledger_packages
              ++ optionals tex_support tex_packages
              ++ optionals lua_support lua_packages
              ++ optionals make_support make_packages
              ++ optionals markdown_support markdown_packages
              ++ optionals nix_support nix_packages
              ++ optionals openscad_support openscad_packages
              ++ optionals python_support python_packages
              ++ optionals scala_support scala_packages
              ++ optionals terraform_support terraform_packages
              ++ optionals typescript_support typescript_packages
              ++ optionals yaml_support yaml_packages;
          };
        });
    };
}
