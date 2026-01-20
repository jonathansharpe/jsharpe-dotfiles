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
	},
	-- detects embedded code within other file types, i.e. CSS within HTML, so doing the comment motion will create a comment in the correct language
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
}
