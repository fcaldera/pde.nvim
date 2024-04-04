return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    -- stylua: ignore
    on_attach = function(bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns

      map({ "n", "v" }, "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr = true, desc = "Jump to next hunk" })

      map({ "n", "v" }, "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true, desc = "Jump to previous hunk" })

      map('n', '<leader>ga', gs.stage_hunk, { desc = "[G]it [A]dd hunk" })
      map('n', '<leader>gr', gs.reset_hunk, { desc = "[G]it [R]eset hunk" })
      -- map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      -- map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      map('n', '<leader>gA', gs.stage_buffer, { desc = "[G]it [A]dd buffer" })
      map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "[G]it [U]ndo stage hunk" })
      map('n', '<leader>gR', gs.reset_buffer,  { desc = "[G]it [R]eset buffer"})
      map("n", "<leader>gp", gs.preview_hunk, { desc = "[G]it [P]review hunk" })
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "[G]it [B]lame" })
      -- map('n', '<leader>tb', gs.toggle_current_line_blame)
      -- map('n', '<leader>hd', gs.diffthis)
      -- map('n', '<leader>hD', function() gs.diffthis('~') end)
      -- map('n', '<leader>td', gs.toggle_deleted)
    end,
  },
}
