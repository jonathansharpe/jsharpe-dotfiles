return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "bashls", "cssls", "denols", "ltex", "ast_grep", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.g.markdown_fenced_languages = {
				"ts=typescript",
			}
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.denols.setup({
				capabilities = capabilities,
			})
		end,
	},
	-- detects embedded code within other file types, i.e. CSS within HTML, so doing the comment motion will create a comment in the correct language
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
}
