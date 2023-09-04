#!/usr/bin/env bash

GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
NC="$(tput sgr0)"

width=40
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

# bash
header "Bash"
checkTools "shellharden"
checkTools "shellcheck"
checkTools "printenv"

# header "Deno"
# checkTools "deno"

# Go
# header "Go"
# checkTools "go"

# Json
# header "Json"
# checkTools "fixjson"
# checkTools "jsonlint"

# Lua
header "Lua"
checkTools "luacheck"     # nix os: luajitPackages.luacheck
checkTools "selene"       # nix os: selene

# Markdown
# header "Markdown"
# checkTools "marksman"
# checkTools "markdownlint"

# Misc languages
# header "Misc"
# checkTools "prettier"

if [ ! "$errors" -eq 0 ]; then
	echo "⚠️ Please verify your installation"
	exit 1
fi
