require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Open images in default viewer (Cross-platform)
autocmd("BufReadPost", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  callback = function()
    local file = vim.fn.expand "%:p"
    local command = {}

    if vim.fn.has "mac" == 1 then
      command = { "open", file }
    elseif vim.fn.has "win32" == 1 then
      command = { "explorer", file }
    elseif vim.fn.executable "termux-open" == 1 then
      command = { "termux-open", file }
    elseif vim.fn.executable "xdg-open" == 1 then
      command = { "xdg-open", file }
    else
      vim.notify("Could not find a command to open image.", vim.log.levels.WARN)
      return
    end

    vim.fn.jobstart(command, { detach = true })

    -- Safe buffer deletion to keep tabline/window intact
    vim.schedule(function()
      local cur_buf = vim.api.nvim_get_current_buf()
      local alt_buf = vim.fn.bufnr "#"

      -- Try switching to alternate buffer if valid, otherwise create a new one
      if alt_buf ~= -1 and vim.fn.buflisted(alt_buf) == 1 then
        vim.cmd "buffer #"
      else
        vim.cmd "enew"
      end

      -- Now delete the image buffer
      pcall(vim.api.nvim_buf_delete, cur_buf, { force = true })
    end)
  end,
})

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
