require "nvchad.autocmds"

-- Auto-pull from remote on startup
local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    local config_path = vim.fn.stdpath("config")
    -- Run git pull asynchronously in the config directory
    vim.fn.jobstart("git pull", {
      cwd = config_path,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.notify("Nvim config synced from remote", vim.log.levels.INFO)
        elseif exit_code ~= 0 then
          vim.notify("Failed to sync nvim config from remote", vim.log.levels.WARN)
        end
      end,
    })
  end,
})
