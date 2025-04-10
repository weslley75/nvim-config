return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
      -- Extensões adicionais
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    keys = {
      -- Busca de arquivos e texto
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar arquivos" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Arquivos recentes" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto no projeto" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Buscar palavra sob o cursor" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Listar buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buscar na ajuda" },
      
      -- Navegador de arquivos
      { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "Navegador de arquivos" },
      
      -- Gerenciamento de projetos
      { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Gerenciador de projetos" },
      
      -- LSP e desenvolvimento
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Símbolos no documento" },
      { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Símbolos no workspace" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Lista de TODOs" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnósticos" },
      { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Commits do Git" },
      { "<leader>fB", "<cmd>Telescope git_branches<cr>", desc = "Branches do Git" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local transform_mod = require("telescope.actions.mt").transform_mod

      -- Integração com Trouble.nvim
      local open_in_trouble = function()
        local trouble = require("trouble")
        local trouble_telescope = require("trouble.sources.telescope")
        
        trouble_telescope.open()
      end

      -- Ações customizadas
      local custom_actions = transform_mod({
        open_trouble_qflist = function()
          require("trouble").toggle("quickfix")
        end,
      })

      -- Configuração do Telescope
      telescope.setup({
        defaults = {
          prompt_prefix = "❯ ",
          selection_caret = "❯ ",
          path_display = { "truncate" },
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              
              ["<C-c>"] = actions.close,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              
              ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
              ["<M-q>"] = actions.send_to_qflist + custom_actions.open_trouble_qflist,
              
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              
              -- Abrir no Trouble
              ["<C-l>"] = open_in_trouble,
            },
            n = {
              ["<esc>"] = actions.close,
              ["q"] = actions.close,
              
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              
              ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
              ["<M-q>"] = actions.send_to_qflist + custom_actions.open_trouble_qflist,
              
              -- Abrir no Trouble
              ["<C-l>"] = open_in_trouble,
            },
          },
        },
        pickers = {
          git_files = {
            theme = "dropdown",
            hidden = true,
            previewer = false,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer,
              },
              n = {
                ["dd"] = actions.delete_buffer,
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- Seus mapeamentos personalizados
              },
              ["n"] = {
                -- Seus mapeamentos personalizados
              },
            },
          },
          project = {
            base_dirs = {
              { "~/Projects", max_depth = 4 },
            },
            hidden_files = true,
            theme = "dropdown",
          },
        },
      })

      -- Carregamento de extensões
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("project")
    end,
  },
}
