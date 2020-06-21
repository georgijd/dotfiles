.DEFAULT_GOAL := all

all: pkg git tig bat tmux fzf zsh ohmyzsh rvm ruby colorls nvm node go lua neovim

.PHONY: pkg-install
pkg-install: ## Install Ubuntu packages
	@./scripts/pkg.sh install

.PHONY: pkg
pkg: pkg-install ## pkg-install

.PHONY: git-install
git-install: ## Install git
	@./scripts/git.sh install

.PHONY: git-configure
git-configure: ## Configure git
	@./scripts/git.sh configure

.PHONY: git
git: git-install git-configure ## git-install git-configure

.PHONY: tig-install
tig-install: ## Install tig
	@./scripts/tig.sh install

.PHONY: tig-configure
tig-configure: ## Configure tig
	@./scripts/tig.sh configure

.PHONY: tig
tig: tig-install tig-configure ## tig-install tig-configure

.PHONY: bat-install
bat-install: ## Install bat
	@./scripts/bat.sh install

.PHONY: bat
bat: bat-install ## bat-install

.PHONY: tmux-install
tmux-install: ## Install tmux
	@./scripts/tmux.sh install

.PHONY: tmux-configure
tmux-configure: ## Configure tmux
	@./scripts/tmux.sh configure

.PHONY: tmux
tmux: tmux-install tmux-configure ## tmux-install tmux-configure

.PHONY: fzf-install
fzf-install: ## Install fzf
	@./scripts/fzf.sh install

.PHONY: fzf
fzf: fzf-install ## fzf-install

.PHONY: zsh-install
zsh-install: ## Install zsh
	@./scripts/zsh.sh install

.PHONY: zsh-configure
zsh-configure: ## Configure zsh
	@./scripts/zsh.sh configure

.PHONY: zsh
zsh: zsh-install zsh-configure ## zsh-install zsh-configure

.PHONY: ohmyzsh-install
ohmyzsh-install: ## Install Oh My Zsh
	@./scripts/ohmyzsh.sh install

.PHONY: ohmyzsh-configure
ohmyzsh-configure: ## Configure Oh My Zsh
	@./scripts/ohmyzsh.sh configure

.PHONY: ohmyzsh
ohmyzsh: ohmyzsh-install ohmyzsh-configure ## ohmyzsh-install ohmyzsh-configure

.PHONY: rvm-install
rvm-install: ## Install rvm
	@./scripts/rvm.sh install

.PHONY: rvm
rvm: rvm-install ## rvm-install

.PHONY: ruby-install
ruby-install: ## Install ruby using rm
	@./scripts/ruby.sh install

.PHONY: ruby
ruby: ruby-install ## ruby-install

.PHONY: nvm-install
nvm-install: ## Install nvm
	@./scripts/nvm.sh install

.PHONY: nvm
nvm: nvm-install ## nvm-install

.PHONY: node-install
node-install: ## Install node using nvm
	@./scripts/node.sh install

.PHONY: node
node: node-install ## node-install

.PHONY: colorls-install
colorls-install: ## Install colorls
	@./scripts/colorls.sh install

.PHONY: colorls-configure
colorls-configure: ## Configure colorls
	@./scripts/colorls.sh configure

.PHONY: colorls
colorls: colorls-install colorls-configure ## colorls-install colorls-configure

.PHONY: go-install
go-install: ## Install golang
	@./scripts/go.sh install

.PHONY: go
go: go-install ## go-install

.PHONY: lua-install
lua-install: ## Install luarocks
	@./scripts/lua.sh install

.PHONY: lua-configure
lua-configure: ## Configure lua
	@./scripts/lua.sh configure

.PHONY: lua
lua: lua-install lua-configure ## lua-install lua-configure

.PHONY: neovim-install
neovim-install: ## Install neovim
	@./scripts/neovim.sh install

.PHONY: neovim-configure
neovim-configure: ## Configure neovim
	@./scripts/neovim.sh configure

.PHONY: neovim
neovim: neovim-install neovim-configure ## neovim-install neovim-configure

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
