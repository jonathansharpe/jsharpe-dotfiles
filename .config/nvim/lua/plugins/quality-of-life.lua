return {

	-- startup screen
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	-- surround stuff in quotes
	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- empty for defaults
			})
		end
	},
	-- shows what keys do what; e.g., press 'z' once and it'll show motions
	{
		"folke/which-key.nvim",
		priorty = 1000,
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
	},
	{ -- makes it like cursor
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = vim.fn.has("win32") ~= 0
			and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			-- add any opts here
			-- this file can contain specific instructions for your project
			instructions_file = "avante.md",
			-- for example
			provider = "gemini",
			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-20250514",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
				moonshot = {
					endpoint = "https://api.moonshot.ai/v1",
					model = "kimi-k2-0711-preview",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 32768,
					},

				},
				gemini = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
					model = "gemini-2.5-flash",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 32768,
					},
				}
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-mini/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		'nvim-java/nvim-java',
		config = function()
			require('java').setup()
			vim.lsp.enable('jdtls')
		end,
	}
}
