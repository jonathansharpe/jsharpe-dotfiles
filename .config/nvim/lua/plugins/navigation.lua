return {
	-- makes motions very fast, makes it easier to jump to a word
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		-- @type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "<Leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "<Leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "<Leader>r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "<Leader>R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},

	-- highlights all matching words under the cursor
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},

	-- adds a window picker
	{
		"yorickpeterse/nvim-window",
		config = function()
			require("nvim-window").setup({})
		end,
	},
	-- tab plugin
	{
		"rafcamlet/tabline-framework.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("tabline_framework").setup({
				render = require("tabline_framework.examples.diagonal_tiles"),
				hl = { fg = "#abb2bf", bg = "#181A1F" },
				hl_sel = { fg = "#abb2bf", bg = "#282c34" },
				hl_fill = { fg = "#ffffff", bg = "#000000" },
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
}
