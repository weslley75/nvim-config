return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "psalm",
          "kotlin_language_server",
          "prismals",
          "jsonls",
        },
      })

      mason_lspconfig.setup_handlers {
        function (server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
        end,
      }

    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",  -- Show function signatures as you type
      "folke/neoconf.nvim",        -- Project-specific LSP settings
      "smjonas/inc-rename.nvim",   -- Interactive rename
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
          },
        },
      })

      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = function(desc)
            return { buffer = ev.buf, desc = desc }
          end
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Show hover"))
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts("List workspace folders"))
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
          vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts("Rename"))
          vim.keymap.set({ "n", "v" }, "<space>la", vim.lsp.buf.code_action, opts("Code action"))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("References"))
        end,
      })

      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        }
      })
      
      -- Add nicer rename UI
      require("inc_rename").setup()
      vim.keymap.set("n", "<leader>lr", ":IncRename ")
    end,
  },
}
