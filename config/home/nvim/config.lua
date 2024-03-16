vim.g.neovide_cursor_animation_length = 0.05
vim.opt.guicursor.a = { "blinkon=0" }

vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>wqa<cr>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>")
