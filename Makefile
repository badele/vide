.PHONY: all clean test help check distrib-list docker-build docker-run try-vim

check-%:
	@: $(if $(value $*),,$(error $* is undefined))

all: help

help: ## This help
	@find . -name Makefile -o -name "*.mk" | xargs -n1 grep -hE '^[a-z0-9\-]+:.* ##' | sed 's/\: .*##/:/g' | sort | column  -ts':'

check: ## Check requirements installation
	@./check.sh

distrib-list: ## List supported distribution
	@ls docker/**.Dockerfile | sed 's/\.Dockerfile//' | sed 's/docker\///'	

docker-build: check-DISTRIB ## Build <DISTRIB> docker image 
	@docker/build ${DISTRIB}

docker-run: check-DISTRIB docker-build ## Run <DISTRIB> docker image
	@docker/run ${DISTRIB}

clean-cache: ## Clean nvim cache configuration
	@rm -rf ~/.local/share/nvim
	@rm -rf ~/.local/state/nvim
	@rm -rf ~/.cache/nvim

try-nvim: ## Try nvim without update your current nvim configuration
	@nix develop --command bash -c "NVIM_APPNAME="vide" nvim"
