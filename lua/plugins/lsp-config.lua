return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "ts_ls", 
        "eslint",
        "psalm",
        "kotlin_language_server",
        "prismals",
        "jsonls",
        "intelephense",
        "zls",
        "rust_analyzer"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "folke/neoconf.nvim",
      "smjonas/inc-rename.nvim",
      "pmizio/typescript-tools.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      -- Configuração compartilhada para todos os servidores LSP
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      -- Configuração padrão aplicada a todos os servidores
      local default_handler = function(server)
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end
      
      -- Configurações específicas para servidores
      local servers = {
        -- Lua com configuração específica
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                }
              },
              telemetry = { enable = false },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        -- TypeScript com organizeImports
        ["ts_ls"] = {
          -- Usamos typescript-tools em vez do tsserver padrão
          enabled = false,
        },
        -- ESLint com formato automático
        eslint = {
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        },
        -- Zig com formatação
        zls = {
          settings = {
            zig = {
              checkOnSave = true,
              enableAutofix = true,
            }
          }
        },
      }

      -- Configurar typescript-tools avançado em vez de tsserver padrão
      require("typescript-tools").setup({
        capabilities = capabilities,
        settings = {
          -- Configurações específicas de TypeScript
          -- https://github.com/pmizio/typescript-tools.nvim#%EF%B8%8F-configuration
          tsserver_file_preferences = {
            importModuleSpecifierPreference = "relative",
          },
          tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = false,
          },
        },
      })

      -- Configuração do Mason-LSPConfig
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          if servers[server_name] then
            if servers[server_name].enabled == false then
              return
            end
            
            local config = vim.tbl_deep_extend(
              "force",
              { capabilities = capabilities },
              servers[server_name] or {}
            )
            
            require("lspconfig")[server_name].setup(config)
          else
            default_handler(server_name)
          end
        end
      })

      -- Configuração do inc_rename para renomeação interativa
      require("inc_rename").setup({
        cmd_name = "IncRename",
        hl_group = "Substitute",
        preview_empty_name = false,
        show_message = true,
        input_buffer_type = "dressing",
      })

      -- Configuração de assinaturas de função
      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        },
        hint_enable = false,
        floating_window = true,
        fix_pos = true,
        doc_lines = 10,
      })

      -- Binds de LSP universal
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local bufnr = ev.buf
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          
          -- Habilitar omnifunc para completamento
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          
          -- Utilitário para adicionar descrições às keymaps
          local desc = function(description)
            return { buffer = bufnr, desc = description }
          end
          
          -- Navegação
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, desc("Ir para declaração"))
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, desc("Ir para definição"))
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, desc("Ir para definição de tipo"))
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, desc("Ir para implementação"))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, desc("Ver referências"))
          
          -- Informação e docs
          vim.keymap.set("n", "K", vim.lsp.buf.hover, desc("Mostrar documentação"))
          
          -- Ações
          vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, desc("Ações de código"))
          vim.keymap.set("v", "<leader>la", vim.lsp.buf.code_action, desc("Ações de código (seleção)"))
          vim.keymap.set("n", "<leader>lr", ":IncRename ", desc("Renomear símbolo"))
          vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, desc("Formatar código"))
          
          -- Diagnósticos
          vim.keymap.set("n", "gl", vim.diagnostic.open_float, desc("Mostrar diagnóstico"))
          vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, desc("Próximo diagnóstico"))
          vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, desc("Diagnóstico anterior"))
          
          -- Workspaces (gerenciamento de projetos)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, desc("Adicionar pasta ao workspace"))
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc("Remover pasta do workspace"))
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, desc("Listar pastas do workspace"))
          
          -- TypeScript específico
          if client.name == "tsserver" or client.name == "typescript-tools" then
            vim.keymap.set("n", "<leader>lo", ":TSToolsOrganizeImports<CR>", desc("Organizar imports"))
            vim.keymap.set("n", "<leader>la", ":TSToolsAddMissingImports<CR>", desc("Adicionar imports faltantes"))
            vim.keymap.set("n", "<leader>lx", ":TSToolsFixAll<CR>", desc("Corrigir todos os problemas"))
            vim.keymap.set("n", "<leader>lu", ":TSToolsRemoveUnused<CR>", desc("Remover imports não utilizados"))
          end
        end,
      })
    end,
  },
}
