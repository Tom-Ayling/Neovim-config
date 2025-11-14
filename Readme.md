# Requirements
[Cmake 3.x](https://github.com/Kitware/CMake/releases/tag/v3.31.6), [ripgrep](https://github.com/BurntSushi/ripgrep#installation), [fd-find](https://github.com/sharkdp/fd#installation), [NerdFont](https://www.nerdfonts.com/) (JetBrainsMonoNL Nerd Font Mono), [Tree-Sitter cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md), [Cargo](https://rust-lang.org/tools/install/)

# Install
- Install the requirements
- Clone the repo into the neovim config dir (Appdata\Local\nvim on windows)

# LSP/Formatter/Linter
- :Mason or <leader>m to open mason where a list of LSPs/Linters/Formatters/DAPs can be found
- Add LSPs to the servers table in lsp.lua
- To override settings for the lsp add them into /after/lsp/lsp_name.lua
- If no settings are provided it will use the defaults from nvim-lspconfig
- To auto install other tools add them to the ensure_installed table in lsp.lua
- Formatters should also be declared in the conform.lua file in the formatters_by_ft table
- Overrides for formatters can be defined in the formatters table in conform.lua
