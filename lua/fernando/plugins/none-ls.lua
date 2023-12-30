return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.completion.spell,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>kf", vim.lsp.buf.format, { desc = "[F]ormat document or selection" })
  end,
}
