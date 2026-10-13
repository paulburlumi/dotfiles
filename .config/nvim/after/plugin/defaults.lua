-- Paul Burlumi changes
-- 2023-01-30

-- Above taken from:
-- https://github.com/nvim-lua/kickstart.nvim

-- Kickstart's format_on_save only covers its enabled_filetypes list, which is
-- empty, so format Go on save here (conform falls back to gopls formatting).
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("format-go-on-save", { clear = true }),
	pattern = "*.go",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
	end,
})

vim.keymap.set("", "<C-Tab>", ":bnext<CR>", {})
vim.keymap.set("", "<C-S-Tab>", ":bprevious<CR>", {})

-- https://github.com/vim/vim/blob/master/runtime/mswin.vim
vim.keymap.set("", "<C-S>", ":update<CR>", { noremap = true })
vim.keymap.set("v", "<C-S>", "<C-C>:update<CR>", { noremap = true })
vim.keymap.set("i", "<C-S>", "<Esc>:update<CR>gi", { noremap = true })

vim.keymap.set("v", "<C-X>", '"+x', { noremap = true })
vim.keymap.set("v", "<C-C>", '"+y', { noremap = true })
vim.keymap.set("", "<C-V>", '"+gP', {})
vim.keymap.set("c", "<C-V>", "<C-R>+", {})

vim.keymap.set("i", "kj", "<Esc>`^", { noremap = true })
-- vim.keymap.set("i", "lkj", "<Esc>`^:w<CR>", { noremap = true })
-- vim.keymap.set("i", ";lkj", "<Esc>`^:wq<CR>", { noremap = true })
vim.keymap.set("t", "kj", "<C-\\><C-n>", { noremap = true, desc = "Exit terminal mode" })

vim.cmd([[
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
]])

vim.opt.cmdheight = 0

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
