{
  description = "A Nix-flake-based vide project development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems
      (system: f {pkgs = import nixpkgs {inherit system;};});
  in {
    devShells = forEachSupportedSystem ({pkgs}: let
      aliascommit = pkgs.writeShellScriptBin "commit" "cz commit";
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          pre-commit
          # git-cliff
          # cocogitto
          nixfmt
          commitizen
          aliascommit

          # neovim plugins build requirements
          cargo

          #######################################################################
          # Bash
          #######################################################################

          # Format
          shfmt

          shellharden
          shellcheck
          #
          # # deno
          deno
          #
          # # json
          nodePackages.fixjson
          nodePackages.jsonlint

          #######################################################################
          # Lua
          #######################################################################

          # Formater
          stylua
          luaformatter

          # # lua
          luajitPackages.luacheck
          selene
          #
          # markdown
          marksman
          nodePackages.markdownlint-cli

          #######################################################################
          # Nix
          #######################################################################

          # Formater
          alejandra
          nixfmt
          nixpkgs-fmt

          #######################################################################
          # Other
          #######################################################################
          # Formater (markdown)
          nodePackages.prettier
        ];
      };
    });
  };
}
