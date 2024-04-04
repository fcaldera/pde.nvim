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

      -- map('n', '<leader>hs', gs.stage_hunk)
      -- map('n', '<leader>hr', gs.reset_hunk)
      -- map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      -- map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      -- map('n', '<leader>hS', gs.stage_buffer)
      -- map('n', '<leader>hu', gs.undo_stage_hunk)
      -- map('n', '<leader>hR', gs.reset_buffer)
      map("n", "<leader>gp", gs.preview_hunk, { desc = "[G]it [P]review hunk" })
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "[Git] [B]lame" })
      -- map('n', '<leader>tb', gs.toggle_current_line_blame)
      -- map('n', '<leader>hd', gs.diffthis)
      -- map('n', '<leader>hD', function() gs.diffthis('~') end)
      -- map('n', '<leader>td', gs.toggle_deleted)
    end,
  },
}
