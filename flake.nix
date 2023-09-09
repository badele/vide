{
  description = "A Nix-flake-based vide project development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs, }:
    let
      ###########################################################################
      # Lanuages Activation
      ###########################################################################
      bash_support = true;
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
          bash_packages = with pkgs; [ shfmt shellharden shellcheck ];

          json_packages = with pkgs; [
            nodePackages.fixjson
            nodePackages.jsonlint
          ];

          lua_packages = with pkgs; [
            # Formater
            stylua
            luaformatter

            luajitPackages.luacheck
            selene
          ];

          make_packages = with pkgs; [
            checkmake
          ];
          
          markdown_packages = with pkgs; [
            marksman
            nodePackages.markdownlint-cli
          ];

          nix_packages = with pkgs; [
            # Formater
            alejandra
            nixfmt
            nixpkgs-fmt
          ];

          python_packages = with pkgs; [ ];

          typescript_packages = with pkgs; [ deno ];
        in
        {
          default = pkgs.mkShell {
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
              ] ++ pkgs.lib.optionals bash_support bash_packages
              ++ pkgs.lib.optionals json_support json_packages
              ++ pkgs.lib.optionals lua_support lua_packages
              ++ pkgs.lib.optionals make_support make_packages
              ++ pkgs.lib.optionals markdown_support markdown_packages
              ++ pkgs.lib.optionals nix_support nix_packages
              ++ pkgs.lib.optionals python_support python_packages
              ++ pkgs.lib.optionals typescript_support typescript_packages;
          };
        });
    };
}
