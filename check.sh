#!/usr/bin/env bash

GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
NC="$(tput sgr0)"

width=25
errors=0

header() {
	printf "\n🔍 %s\n" "$1"
}

checkTools() {
	cmd=$1
	package=${cmd}

	if [ "$2" != "" ]; then
		package=$2
	fi

	if command -v "$cmd" >/dev/null; then
		status="[✔️]"
		color="$GREEN"
	else
		errors=1
		status="[!]"
		color="$RED"
	fi

	printf "%-${width}s %s%s%s\n" "$package" "$color" "$status" "$NC"
}

echo "🔎 nvim-starter installaction checker 🔎"
header "Requirements"
# checkTools "fzf"
checkTools "cmake"
checkTools "fd"
checkTools "lazygit"
checkTools "make"
checkTools "npm"
checkTools "python"
checkTools "tree-sitter"
checkTools "xclip"
checkTools "yarn"

###############################################################################
# languages support
###############################################################################
#
if [ "$VIDE_ANSIBLE_SUPPORT" == "true" ]; then
	header "Ansible support"
	checkTools "ansible-lint"
fi

if [ "$VIDE_BASH_SUPPORT" == "true" ]; then
	header "Bash support"
	checkTools "printenv"
	checkTools "shellcheck"
	checkTools "shellharden"
fi

if [ "$VIDE_JSON_SUPPORT" == "true" ]; then
	header "JSON support"
	checkTools "fixjson"
	checkTools "jsonlint"
fi

if [ "$VIDE_LUA_SUPPORT" == "true" ]; then
	header "Lua support"
	checkTools "lua-format"
	checkTools "luacheck"
	checkTools "selene"
	checkTools "stylua"
fi

if [ "$VIDE_MAKE_SUPPORT" == "true" ]; then
	header "Makefile support"
	checkTools "checkmake"
fi

if [ "$VIDE_MARKDOWN_SUPPORT" == "true" ]; then
	header "Markdown support"
	checkTools "markdownlint"
	checkTools "marksman"
fi

if [ "$VIDE_NIX_SUPPORT" == "true" ]; then
	header "Nix support"
	checkTools "alejandra"
	checkTools "deadnix"
	checkTools "nixfmt"
	checkTools "nixpkgs-fmt"
	checkTools "statix"
fi

if [ "$VIDE_PYTHON_SUPPORT" == "true" ]; then
	header "Python support"
	checkTools "autoflake"
	checkTools "autopep8"
	checkTools "black"
	checkTools "mypy"
	checkTools "pycodestyle"
	checkTools "pydocstyle"
	checkTools "pylint"
	checkTools "python3"
	checkTools "ruff"
	checkTools "semgrep"
	checkTools "vulture"
fi

if [ "$VIDE_TERRAFORM_SUPPORT" == "true" ]; then
	header "Terraform support"
	checkTools "terraform"
	checkTools "terraform-ls"
fi

if [ "$VIDE_TYPESCRIPT_SUPPORT" == "true" ]; then
	header "Typescript support"
	checkTools "deno"
fi

if [ ! "$errors" -eq 0 ]; then
	echo "⚠️ Please verify your installation"
	exit 1
fi
