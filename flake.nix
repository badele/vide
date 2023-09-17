{
  description = "A Nix-flake-based vide project development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  # inputs.nixpkgs.url = "path:/home/badele/ghq/github.com/badele/fork-nixpkgs";

  outputs = { self, nixpkgs }:
    let
      ###########################################################################
      # Lanuages Activation
      ###########################################################################
      ansible_support = true;
      bash_support = true;
      deno_support = true;
      json_support = true;
      lua_support = true;
      make_support = true;
      markdown_support = true;
      nix_support = true;
      python_support = true;
      typescript_support = true;

      supportedSystems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
          (system: f { pkgs = import nixpkgs { inherit system; }; });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }:
        let
          aliascommit = pkgs.writeShellScriptBin "commit" "cz commit";

          ###########################################################################
          # Lanuages support
          ###########################################################################
          ansible_packages = with pkgs; [
            ansible-lint
          ];

          bash_packages = with pkgs; [ shfmt shellharden shellcheck ];

          deno_packages = with pkgs; [ deno ];

          json_packages = with pkgs; [
            nodePackages.fixjson
            nodePackages.jsonlint
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
          ];

          nix_packages = with pkgs; [
            # Formater
            alejandra
            deadnix
            nixd
            nil
            nixfmt
            nixpkgs-fmt
            rnix-lsp
            statix
          ];

          python_packages = with pkgs; [
            ruff
            semgrep
            (python3.withPackages (ps:
              with ps; [
                autoflake
                autopep8
                black
                mypy
                pycodestyle
                pydocstyle
                pylint
                vulture
              ]))
          ];

          typescript_packages = with pkgs; [ deno ];
        in
        with pkgs;
        with lib; {
          default = pkgs.mkShell {
            shellHook = ''
                export VIDE_ANSIBLE_SUPPORT=${boolToString ansible_support}
              export VIDE_BASH_SUPPORT=${boolToString bash_support}
              export VIDE_DENO_SUPPORT=${boolToString deno_support}
              export VIDE_JSON_SUPPORT=${boolToString json_support}
              export VIDE_LUA_SUPPORT=${boolToString lua_support}
              export VIDE_MAKE_SUPPORT=${boolToString make_support}
              export VIDE_MARKDOWN_SUPPORT=${boolToString markdown_support}
              export VIDE_NIX_SUPPORT=${boolToString nix_support}
              export VIDE_PYTHON_SUPPORT=${boolToString python_support}
              export VIDE_TYPESCRIPT_SUPPORT=${boolToString typescript_support}
            '';

            packages = with pkgs;
              [
                # git-cliff
                # cocogitto
                # nixfmt

                # vide project requirements
                pre-commit
                commitizen
                aliascommit

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
                nodePackages.prettier
              ] ++ optionals ansible_support ansible_packages
              ++ optionals bash_support bash_packages
              ++ optionals deno_support deno_packages
              ++ optionals json_support json_packages
              ++ optionals lua_support lua_packages
              ++ optionals make_support make_packages
              ++ optionals markdown_support markdown_packages
              ++ optionals nix_support nix_packages
              ++ optionals python_support python_packages
              ++ optionals typescript_support typescript_packages;
          };
        });
    };
}
