return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    })
    
    vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, 
      { desc = "Search sessions" })
  end,
}
