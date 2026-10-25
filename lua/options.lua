require "nvchad.options"

-- local o = vim.o

if vim.fn.executable "termux-open" == 1 then
  vim.cmd "syntax on" -- treesitter decoration provider broken on Termux (extmarks=0)
end
