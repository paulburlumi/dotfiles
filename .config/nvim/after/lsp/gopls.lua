-- Merged over nvim-lspconfig's lsp/gopls.lua (cmd, filetypes, root_markers);
-- after/ comes last on the runtimepath, so these settings win.
-- See `:help lsp-config` and https://go.dev/gopls/settings
---@type vim.lsp.Config
return {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			linksInHover = false,
			codelenses = {
				generate = true,
				regenerate_cgo = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			usePlaceholders = true,
		},
	},
}
