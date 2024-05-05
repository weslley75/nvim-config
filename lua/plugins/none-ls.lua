return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
    })

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
    vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
  end,
}
