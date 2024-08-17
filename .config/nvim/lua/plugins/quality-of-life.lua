return {

	-- startup screen
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	-- shows what keys do what; e.g., press 'z' once and it'll show motions
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	-- shows line number while you type
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	},
	-- makes cursor smooth ig
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup({
				fancy = {
					enable = true,
				},
			})
		end,
	},
	-- makes the ui look nice i think
	{
		"stevearc/dressing.nvim",
	},
	-- adds an icon picker! what did you expect?
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},
	-- an undo tree, to make it easier to go back without spamming Ctrl+R 100 times
	{
		"mbbill/undotree",
	},
	-- highlights hex color codes in their respective color
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- adds a few UNIX commands to nvim, notably :SudoWrite
	{
		"tpope/vim-eunuch",
	},

	-- makes folds cleaner
	{
		"lewis6991/cleanfold.nvim",
		config = function()
			require("cleanfold").setup()
		end,
	},

	-- makes it easier to align stuff ig
	{
		"junegunn/vim-easy-align",
	},
	-- speeds up nvim load times
	{
		"lewis6991/impatient.nvim",
	},
	-- markdown preview for notes
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
	},
	-- gives cheatsheet when running a command
	{
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		-- highly experimental plugin that replaces the ui for
		-- messages, cmdline, and the popupmenu
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup {}
		end
	}
}
