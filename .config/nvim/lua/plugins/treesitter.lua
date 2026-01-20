-- massively improves nvim's syntax highlighting, in both speed and readability
return {
	-- splitting/joining blocks of code like if statements, etc.
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local config = require("nvim-treesitter.config")
			config.setup({
				ensure_installed = {
					"bash",
					"c",
					"cmake",
					"comment",
					"cpp",
					"css",
					"html",
					"java",
					"javascript",
					"json",
					"jsonc",
					"latex",
					"lua",
					"make",
					"markdown",
					"python",
					"regex",
					"rust",
					"rst",
					"vim",
					"vimdoc",
					"query",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
				},
				build = ":TSUpdate",
			})
		end,
	},
}
