return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  -- Key mappings will load the plugin the first time they get executed.
  keys = {
    { "<leader>f", ":Neotree toggle current reveal_force_cwd<cr>", desc = "Toggle [F]ile explorer" },
    { "<leader>b", ":Neotree toggle show buffers right<cr>",  desc = "Toggle [B]uffers explorer" }
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = true,
      window = {
        width = 40,
      },
      filesystem = {
        hijack_netrw_behavior = "disabled",
      }
    }
  end,
}
