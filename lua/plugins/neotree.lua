return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<Leader>e", function()
      local reveal_file = vim.fn.expand("%:p")
      if reveal_file == "" then
        reveal_file = vim.fn.getcwd()
      else
        local f = io.open(reveal_file, "r")
        if f then
          f.close(f)
        else
          reveal_file = vim.fn.getcwd()
        end
      end
      require("neo-tree.command").execute({
        reveal_file = reveal_file, -- path to file or folder to reveal
        reveal_force_cwd = true, -- change cwd without asking if needed
        toggle = true, -- toggle the neo-tree
      })
    end, { desc = "Toggle tree" })
  end,
}
