return {
  "tpope/vim-fugitive", -- Git related plugins
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  -- This navigator interfeered with the <C-k> keymap from the LSPs
  -- As an alternative, use <C-w> + motion combo
  -- "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "mbbill/undotree",
  { "folke/which-key.nvim", lazy = true },
}
