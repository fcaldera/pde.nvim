return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local function switch_to(source)
      require("neo-tree.command").execute({ action = "focus", source = source, position = "current" })
    end

    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "current",
        width = 40,
        mappings = {
          ["<space>"] = "none",
          ["f"] = "none",

          ["e"] = "switch_to_filesystem",
          ["b"] = "switch_to_buffers",
          ["g"] = "switch_to_git_status",
        },
      },
      commands = {
        switch_to_filesystem = function()
          switch_to("filesystem")
        end,
        switch_to_buffers = function()
          switch_to("buffers")
        end,
        switch_to_git_status = function()
          switch_to("git_status")
        end,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    })

    vim.keymap.set("n", "<leader>ke", ":Neotree show reveal_force_cwd current<CR>", { desc = "Show file [E]xplorer" })
    vim.keymap.set("n", "<leader>kt", ":Neotree show focus reveal left<CR>", { desc = "Show/focus file [T]ree" })
    vim.keymap.set("n", "<leader>kg", ":Neotree float git_status<CR>", { desc = "[G]it status dialog" })
  end,
}
