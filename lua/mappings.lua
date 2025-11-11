require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Up>", "<nop>", { desc = "Disable key"})
map("n", "<Down>", "<nop>", { desc = "Disable key"})
map("n", "<Left>", "<nop>", { desc = "Disable key"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<Right>", "<nop>", { desc = "Disable key"})
map("i", "<Up>", "<nop>", { desc = "Disable key"})
map("i", "<Down>", "<nop>", { desc = "Disable key"})
map("i", "<Left>", "<nop>", { desc = "Disable key"})
map("i", "<Right>", "<nop>", { desc = "Disable key"})
