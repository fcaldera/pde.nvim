local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        neotree = true,
        mason = true,
        which_key = true,
      },
      highlight_overrides = {
        all = function(colors)
          return {
            LineNr = { fg = colors.overlay2 },
          }
        end,
      }
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

local nightfly = {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  priority = 1000,
  lazy = false,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  lazy = false,
  config = function()
    require("kanagawa").setup({
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    })

    vim.cmd.colorscheme("kanagawa")
  end,
}

return catppuccin
