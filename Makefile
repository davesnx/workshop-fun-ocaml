project_name = workshop

DUNE = opam exec -- dune
opam_file = $(project_name).opam

.PHONY: help
help: ## Print this help message
	@echo "";
	@echo "List of available make commands";
	@echo "";
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}';
	@echo "";

.PHONY: clean
clean: ## Clean artifacts
	$(DUNE) clean

.PHONY: format
format: ## Format the codebase with ocamlformat
	@DUNE_CONFIG__GLOBAL_LOCK=disabled $(DUNE) build @fmt --auto-promote

.PHONY: format-check
format-check: ## Checks if format is correct
	@DUNE_CONFIG__GLOBAL_LOCK=disabled $(DUNE) build @fmt

.PHONY: create-switch
create-switch: ## Create opam switch
	opam switch create . 5.2.0 --deps-only --with-test --no-install -y

.PHONY: install
install:
	opam install . --deps-only --with-test --with-doc --with-dev-setup -y

.PHONY: install-npm
install-npm:
	npm install

.PHONY: pin
pin: ## Pin dependencies
	opam pin add server-reason-react.dev "https://github.com/ml-in-barcelona/server-reason-react.git#5df1a8af48c98c175f66b9a45530bada430f237b" -y
	opam pin add dune-build-info.dev "https://github.com/davesnx/dune.git#74c50d02724b634201d505bda21add3e8f6e298e" -y
	opam pin add dune-configurator.dev "https://github.com/davesnx/dune.git#74c50d02724b634201d505bda21add3e8f6e298e" -y
	opam pin add dune.dev "https://github.com/davesnx/dune.git#74c50d02724b634201d505bda21add3e8f6e298e" -y

# Currently the lsp doesn't compile with mlx, need to wait for the PR to get merged
# opam pin add ocaml-lsp-server.dev "https://github.com/davesnx/ocaml-lsp.git#0988f2b9b0ea6822ed0f8a970b7eaf807605f772" -y

.PHONY: init
init: create-switch pin install install-npm ## Create a local dev enviroment

.PHONY: dev
dev: ## Build the project on each change
	@$(DUNE) build --profile=dev --force --watch @client @server

.PHONY: build
build: ## Build the project
	@$(DUNE) build --profile=dev @client @server

.PHONY: build-watch
build-watch: ## Build the project on each change
	@$(DUNE) build --profile=dev --force --watch @client @server

.PHONY: build-prod
build-prod: ## Build for production (--profile=prod)
	$(DUNE) build --profile=prod @client @server

.PHONY: demo-serve
serve: build ## Serve the demo executable
	@opam exec -- _build/default/src/server.exe

.PHONY: serve-watch
serve-watch: ## Run demo executable on watch mode (listening to built_at.txt changes)
	@watchexec --no-vcs-ignore -w .running/built_at.txt -r -c -- "_build/default/src/server.exe"
