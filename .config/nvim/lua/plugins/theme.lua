-- use this space for whatever colorscheme you are using this hour
return {
	{
		'EdenEast/nightfox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nightfox').setup({
				options = {
				}
			})
			-- vim.cmd.colorscheme "terafox"
		end
	},
	-- adds the base-16 color schemes to nvim
	{
		"RRethy/nvim-base16",
	},
	-- adds transparency to nvim, only if the nvim color scheme exact matches the terminal's
	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({})
		end,
	},
	{
		-- goated catppuccin theme, will likely use again
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "catppuccin"
		end
	}
}
