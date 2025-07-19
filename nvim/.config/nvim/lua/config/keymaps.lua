-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
map("n", "<leader>gtj", "<cmd>GoTagAdd json<cr>", { desc = "Implement GoTagAdd json" })
map("n", "<leader>gtg", "<cmd>GoTagAdd gorm<cr>", { desc = "Implement GoTagAdd gorm" })
map("n", "<leader>gtd", "<cmd>GoTagAdd db<cr>", { desc = "Implement GoTagAdd db" })
