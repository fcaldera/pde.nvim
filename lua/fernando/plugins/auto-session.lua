return {
  "rmagatti/auto-session",
  config = function()
    ---@diagnostic disable-next-line missing-fields
    require("auto-session").setup({
      log_level = "error",
      auto_session_enabled = true,
      auto_session_use_git_branch = true,
      auto_session_suppress_dirs = {
        "~/",
        "~/Documents",
        "~/Downloads",
        "~/Desktop",
        "~/projects",
        "~/salemove",
      },
    })
  end,
}
