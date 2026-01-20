-- use this space for whatever colorscheme you are using this hour
return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {"nightfox", "catppuccin-mocha", "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "moonfly"}
			})
		end
	},
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
	-- WARNING: the below set adds a TON of color schemes and makes it
	-- hard to choose one using the which-colorscheme plugin
	-- adds the base-16 color schemes to nvim
	{
		"RRethy/nvim-base16",
		priorty = 1000
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
		-- config = function()
		-- 	-- vim.cmd.colorscheme "catppuccin"
		-- end
	},
	{
		-- dark color scheme that looks neat
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		-- config = function ()
		-- 	vim.cmd [[colorscheme moonfly]]
		-- end
	}
}
