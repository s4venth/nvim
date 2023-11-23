# Plugins

### Basic plugins
|Plugin|Reason|Description|Extensions|
|------|------|-----------|----------|
|[alpha-nvim](https://github.com/goolord/alpha-nvim)|Greeter|fast and fully programmable greeter for neovim.||
|[barbecue.nvim](https://github.com/utilyre/barbecue.nvim)|Winbar|VS Code like winbar that uses nvim-navic in order to get LSP context from your language server.||
|[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)|Tabline|A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.||
|[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)|Git diff & blame|Super fast git decorations implemented purely in Lua.||
|[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)|Better indents|This plugin adds indentation guides to Neovim.||
|[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)|Statusline|A blazing fast and easy to configure Neovim statusline written in Lua.||
|[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)|Preview hex colors|A high-performance color highlighter for Neovim ||
|[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)|Fuzzy-finder|highly extendable fuzzy finder over lists.|[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)|

### LSP plugins
In loading order on startup:
- `Startup`
  - [`Mason.nvim`](https://github.com/williamboman/mason.nvim)
    - [`Mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim)
      - [`lspconfig`](https://github.com/neovim/nvim-lspconfig)
    - [`lsp-status.nvim`](https://github.com/nvim-lua/lsp-status.nvim)
- `BufNew`
  - [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp)
    - [`cmp-buffer`](https://github.com/hrsh7th/cmp-buffer)
      - [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp)
    - [`cmp-path`](https://github.com/hrsh7th/cmp-path)
    - [`LuaSnip`](https://github.com/L3MON4D3/LuaSnip)
    - [`cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip)
    - [`cmp-cmdline`](https://github.com/hrsh7th/cmp-cmdline)
    - [`lspkind.nvim`](https://github.com/onsails/lspkind.nvim)
> [!IMPORTANT]
> Loading LSP configurations must be in order `Mason.nvim` &#8594; `mason-lspconfig.nvim` &#8594; `nvim-lspconfig`

#### List of LSP plugins
|Plugin|Reason|
|------|------|
|[mason.nvim](https://github.com/williamboman/mason.nvim)|LSP package manager|
|[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)|Fixes for Mason to work with nvim-lspconfig|
|[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)|Official LSP configurations plugin|
|[lsp-status.nvim](https://github.com/nvim-lua/lsp-status.nvim)|idk|
|[trouble.nvim](https://github.com/folke/trouble.nvim)|Diagnostics|

#### List of completion plugins
|Plugin|Reason|
|------|------|
|[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)|Completion|
|[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)|LSP source for cmp|
|[LuaSnip](https://github.com/L3MON4D3/LuaSnip)|Snippet engine|
|[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)|LuaSnip source for cmp|
|[cmp-path](https://github.com/hrsh7th/cmp-path)|Filesystem path completion|
|[cmp-buffer](https://github.com/hrsh7th/cmp-buffer)|Buffer completion|
|[cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)|Commandline completion|
|[lsp-kind.nvim](https://github.com/onsails/lspkind.nvim)|Pretty visuals|

### File structure
```
├── nvim  
|   ├── init.lua  
|   ├── lua
|   |   ├── lush_themes
|   |   |   ├──
|   │   ├── plugins.lua
|   │   ├── config.lua
|   |   └── settings.lua
|   └── lazy-lock.json  
```
## Prerequisites
The dependencies are:
  - `make` for building [LuaSnip](https://github.com/L3MON4D3/LuaSnip) and [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
  - [Neovim](https://github.com/neovim/neovim) nightly/pre-release for winbar support
  - [Neovide](https://github.com/neovide/neovide) (Optional)

## Special thanks
  - [LunarVim](https://www.lunarvim.org/)
