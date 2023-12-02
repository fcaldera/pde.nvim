return {
  "rmagatti/session-lens",
  dependencies = {
    "rmagatti/auto-session",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("session-lens").setup({ winblend = 10 })
    require("telescope").load_extension("session-lens")

    vim.keymap.set("n", "<leader>ss", require("session-lens").search_session, { desc = "Search [S]essions" })
  end,
}
