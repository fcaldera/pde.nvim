-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- [[ My custom keymaps ]]

-- Show git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })

-- Show undo tree panel
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Alternative delete/replace: avoid registers
vim.keymap.set({ "n", "v" }, "<M-d>", '"_d', { desc = "[D]elete to the void register" })
vim.keymap.set("x", "<M-p>", [["_dP]], { desc = "[P]aste to void register" })

-- Keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Quickfix navigation. Commented until I know what the heck is that
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- The primeagen said that Q was the worst place in the universe.
-- I still don't know why, but here we are!
vim.keymap.set("n", "Q", "<nop>")

-- [[ My commands variations ]]

-- Register parent command group
require("which-key").register({
  ["<leader>k"] = { name = "Commands", _ = "which_key_ignore" },
})

-- Replace all of the word-under-cursor occurrences
vim.keymap.set(
  "n",
  "<leader>kr",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[R]eplace all with..." }
)

-- vim: ts=2 sts=2 sw=2 et
