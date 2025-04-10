# Neovim Configuration

[![Plugins](https://dotfyle.com/weslley75/nvim-config/badges/plugins?style=flat)](https://dotfyle.com/weslley75/nvim-config)
[![Leader Key](https://dotfyle.com/weslley75/nvim-config/badges/leaderkey?style=flat)](https://dotfyle.com/weslley75/nvim-config)
[![Plugin Manager](https://dotfyle.com/weslley75/nvim-config/badges/plugin-manager?style=flat)](https://dotfyle.com/weslley75/nvim-config)

This is a modern Neovim configuration with focus on productivity for developers. It includes a carefully selected set of plugins for code editing, navigation, LSP integration, debugging, and visual enhancements.

## Features

- **Lazy Plugin Manager**: Fast and efficient plugin loading
- **LSP Integration**: Intelligent code completion and diagnostics
- **Treesitter**: Advanced syntax highlighting and code navigation
- **Telescope**: Fuzzy finder for files, text, and more
- **Completions**: Smart code completions with nvim-cmp
- **Git Integration**: Git integration with Fugitive and Gitsigns
- **Debugging**: Integrated debugging with nvim-dap
- **Catppuccin Theme**: Beautiful and customizable colorscheme
- **Harpoon**: Quick file navigation
- **Copilot**: AI-powered coding assistant
- **Project Management**: Session management and project navigation

## Installation

> Requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository to your Neovim configuration directory:

```sh
git clone git@github.com:weslley75/nvim-config ~/.config/weslley75/nvim-config
```

Open Neovim with this config:

```sh
NVIM_APPNAME=weslley75/nvim-config/ nvim
```

## Plugin Structure

The configuration is organized into modular files in the `lua/plugins/` directory, each responsible for a specific functionality:

- `lsp-config.lua`: Language Server Protocol setup
- `completions.lua`: Auto-completion
- `telescope.lua`: Fuzzy finding and navigation
- `treesitter.lua`: Advanced syntax highlighting
- `debugging.lua`: Debug Adapter Protocol setup
- `git.lua`: Git integration
- `catppuccin.lua`: Color scheme
- `motion.lua`: Enhanced movement (Harpoon, Flash)
- `copilot.lua`: GitHub Copilot integration

## Key Mappings

> Leader key is set to Space

### Navigation

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<C-h>` | `<C-w>h` | Move to left window |
| `<C-j>` | `<C-w>j` | Move to down window |
| `<C-k>` | `<C-w>k` | Move to up window |
| `<C-l>` | `<C-w>l` | Move to right window |
| `<S-l>` | `:BufferNext<CR>` | Move to next buffer |
| `<S-h>` | `:BufferPrevious<CR>` | Move to previous buffer |
| `<leader>bc` | `:BufferClose<CR>` | Close current buffer |
| `<leader>bC` | `:BufferCloseAllButCurrent<CR>` | Close all buffers except current |

### Finding and Searching (Telescope)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>ff` | `Telescope find_files` | Search for files |
| `<leader>fr` | `Telescope oldfiles` | Recent files |
| `<leader>fg` | `Telescope live_grep` | Search text in project |
| `<leader>fw` | `Telescope grep_string` | Search word under cursor |
| `<leader>fb` | `Telescope buffers` | List buffers |
| `<leader>fh` | `Telescope help_tags` | Search in help |
| `<leader>fe` | `Telescope file_browser` | File browser |
| `<leader>fp` | `Telescope project` | Project manager |
| `<leader>fs` | `Telescope lsp_document_symbols` | Document symbols |
| `<leader>fS` | `Telescope lsp_workspace_symbols` | Workspace symbols |
| `<leader>ft` | `TodoTelescope` | List TODOs |
| `<leader>fd` | `Telescope diagnostics` | Diagnostics |
| `<leader>fc` | `Telescope git_commits` | Git commits |
| `<leader>fB` | `Telescope git_branches` | Git branches |

### LSP

| Shortcut | Action | Description |
|----------|--------|-------------|
| `gD` | `vim.lsp.buf.declaration` | Go to declaration |
| `gd` | `vim.lsp.buf.definition` | Go to definition |
| `gt` | `vim.lsp.buf.type_definition` | Go to type definition |
| `gi` | `vim.lsp.buf.implementation` | Go to implementation |
| `gr` | `vim.lsp.buf.references` | Find references |
| `K` | `vim.lsp.buf.hover` | Show documentation |
| `<leader>la` | `vim.lsp.buf.code_action` | Code actions |
| `<leader>lr` | `:IncRename` | Rename symbol |
| `<leader>lf` | `vim.lsp.buf.format` | Format code |
| `gl` | `vim.diagnostic.open_float` | Show diagnostic |
| `<leader>lj` | `vim.diagnostic.goto_next` | Next diagnostic |
| `<leader>lk` | `vim.diagnostic.goto_prev` | Previous diagnostic |

### TypeScript Specific

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>lo` | `:TSToolsOrganizeImports` | Organize imports |
| `<leader>la` | `:TSToolsAddMissingImports` | Add missing imports |
| `<leader>lx` | `:TSToolsFixAll` | Fix all problems |
| `<leader>lu` | `:TSToolsRemoveUnused` | Remove unused imports |

### Git

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>gp` | `:Gitsigns preview_hunk` | Preview git hunk |

### File Explorer

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>e` | `nvim-tree.toggle` | Toggle file explorer |

### Debugging

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>dt` | `dap.toggle_breakpoint` | Toggle breakpoint |
| `<leader>dc` | `dap.continue` | Continue debugging |

### Code Commenting

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>/` | Line comment toggle | Toggle line comment |
| `<leader>*` | Block comment toggle | Toggle block comment |

### Harpoon (Quick File Navigation)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>ha` | `harpoon:list():add()` | Add file to harpoon |
| `<leader>hh` | `harpoon.ui:toggle_quick_menu` | Show harpoon menu |
| `<leader>hp` | `harpoon:list():prev()` | Previous harpoon file |
| `<leader>hn` | `harpoon:list():next()` | Next harpoon file |
| `<leader>ht` | `toggle_telescope` | Show harpoon in telescope |

### Trouble (Diagnostics List)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>xx` | `:TroubleToggle` | Toggle trouble list |
| `<leader>xw` | `:TroubleToggle workspace_diagnostics` | Workspace diagnostics |
| `<leader>xd` | `:TroubleToggle document_diagnostics` | Document diagnostics |
| `<leader>xq` | `:TroubleToggle quickfix` | Quickfix list |
| `<leader>xl` | `:TroubleToggle loclist` | Location list |
| `<leader>xt` | `:TodoTrouble` | TODOs in trouble |

### Sessions

| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>ss` | `auto-session.search_session` | Search sessions |

### Flash (Enhanced Motion)

| Shortcut | Action | Description |
|----------|--------|-------------|
| `s` | `flash.jump` | Flash jump |
| `S` | `flash.treesitter` | Flash treesitter |
| `r` | `flash.remote` | Remote flash |
| `R` | `flash.treesitter_search` | Treesitter search |

## Additional Features

### IDE-like Features
- Automatic pairs with nvim-autopairs
- Surround selections with nvim-surround
- Enhanced scrolling with cinnamon.nvim
- Beautiful indentation guides
- Color highlighting for color codes
- Project root detection

### Workspace Management
- Session management with auto-session
- Project-aware navigation

### Extensions
- TodoComments for managing TODO annotations
- WhichKey for discovering and explaining keymaps
- Alpha dashboard for a beautiful start screen

## Customization

The core configuration files are found in:
- `lua/vim-options.lua`: General Neovim settings
- `lua/vim-keymaps.lua`: Basic keymappings
- `init.lua`: Entry point and Lazy plugin manager setup

To modify or extend this configuration, edit the appropriate files or add new plugin configuration files in the `lua/plugins/` directory.
