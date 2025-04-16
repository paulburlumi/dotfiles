-- Paul Burlumi changes
-- 2023-01-30

-- Above taken from:
-- https://github.com/nvim-lua/kickstart.nvim

-- https://github.com/ChrisAmelia/dotfiles/blob/master/nvim/lua/lsp.lua
require("lspconfig").gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			linksInHover = false,
			codelenses = {
				generate = true,
				gc_details = true,
				regenerate_cgo = true,
				tidy = true,
				upgrade_depdendency = true,
				vendor = true,
			},
			usePlaceholders = true,
		},
	},
})

vim.opt.clipboard = vim.opt.clipboard ^ { "unnamed" }
vim.opt.clipboard = vim.opt.clipboard ^ { "unnamedplus" }

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

vim.api.nvim_exec(
	[[
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
]],
	false
)

require("nvim-treesitter.install").compilers = { "clang" }

-- override the default above.
vim.opt.hlsearch = true

vim.opt.cmdheight = 0

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
