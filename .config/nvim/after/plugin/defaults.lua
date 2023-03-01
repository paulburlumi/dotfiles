-- Paul Burlumi changes
-- 2023-01-30

-- Above taken from:
-- https://github.com/nvim-lua/kickstart.nvim

-- https://github.com/ChrisAmelia/dotfiles/blob/master/nvim/lua/lsp.lua
require('lspconfig').gopls.setup {
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
}

vim.opt.clipboard = vim.opt.clipboard ^ { "unnamed" }
vim.opt.clipboard = vim.opt.clipboard ^ { "unnamedplus" }

vim.api.nvim_set_keymap('', '<C-Tab>', ':bnext<cr>', {})
vim.api.nvim_set_keymap('', '<C-S-Tab>', ':bprevious<cr>', {})

-- https://github.com/vim/vim/blob/master/runtime/mswin.vim
vim.api.nvim_set_keymap('', '<C-S>', ':update<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-S>', '<C-C>:update<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc>:update<cr>gi', { noremap = true })

vim.api.nvim_set_keymap('v', '<C-X>', '"+x', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('', '<C-V>', '"+gP', {})
vim.api.nvim_set_keymap('c', '<C-V>', '<C-R>+', {})

vim.api.nvim_exec(
[[
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
]],
false)

require 'nvim-treesitter.install'.compilers = { "clang" }

-- override the default above.
vim.o.hlsearch = true

vim.o.cmdheight = 0

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
