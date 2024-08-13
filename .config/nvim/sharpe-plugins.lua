
require("lazy").setup({
	-- use this space for whatever colorscheme you are using this hour
	{
		'EdenEast/nightfox.nvim',
		lazy = false,
		priority = 1000,
	},
	-- adds file tree, very useful
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		}
	},

	-- nice list of all the errors in your code
	{
		"folke/trouble.nvim",
		dependencies = {'nvim-tree/nvim-web-devicons'},
		opts = {}
	},

	-- shows what keys do what; e.g., press 'z' once and it'll show motions
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup{}
		end
	},


	-- splitting/joining blocks of code like if statements, etc.
	{
		'Wansmer/treesj',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesj').setup({})
		end
	},

	-- shows line number while you type
	{
		'nacro90/numb.nvim',
		config = function()
			require('numb').setup()
		end
	},

	{
		'gen740/SmoothCursor.nvim',
		config = function()
			require('smoothcursor').setup({
				fancy = {
					enable = true
				}
			})
		end
	},

	-- shows breadcrumb-like things at the top so you know what file
	-- and function you're in
	{
		'utilyre/barbecue.nvim',
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons"
		},
		opts = {
		}
	},
	-- makes motions very fast
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		-- @type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "<Leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "<Leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "<Leader>r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "<Leader>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	-- shows a nice little buffer switcher
	{
		'LukasPietzschmann/telescope-tabs',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require('telescope-tabs').setup{}
		end
	},

	-- highlights all matching words under the cursor
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require('nvim-cursorline').setup{
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = {underline = true},
				}
			}
		end,
	},

	-- adds a window picker
	{
		'yorickpeterse/nvim-window',
		config = function()
			require('nvim-window').setup{}
		end
	},

	{
		"ray-x/aurora",
	},
	-- adds debugging features
	{
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap"
	},
	{
		"mfussenegger/nvim-dap"
	},

	{"stevearc/dressing.nvim"},
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true
			})
		end
	},
	-- adds a startup screen
	{
		'goolord/alpha-nvim',
		config = function()
			require('alpha').setup(require'alpha.themes.startify'.config)
		end
	},

	-- pop-up with function parameter guide
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup(cfg)
		end
	},

	-- speeds up nvim load times
	{"lewis6991/impatient.nvim"},

	-- an undo tree, to make it easier to go back without spamming Ctrl+R 100 times
	{ "mbbill/undotree" },

	-- adds transparency to nvim, only if the vim color scheme exact matches the terminal's
	{
		'xiyaowong/nvim-transparent',
		config = function()
			require("transparent").setup({
			})
		end
	},

	-- adds a fuzzy finder
	{
		"nvim-telescope/telescope.nvim", branch = '0.1.x',
		dependencies = {'nvim-lua/plenary.nvim'}
	},

	-- tab plugin
	{
		'rafcamlet/tabline-framework.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('tabline_framework').setup {
				render = require('tabline_framework.examples.diagonal_tiles'),
				hl = { fg = '#abb2bf', bg = '#181A1F' },
				hl_sel = { fg = '#abb2bf', bg = '#282c34'},
				hl_fill = { fg = '#ffffff', bg = '#000000'},
			}
		end
	},

	-- automatically create annotation templates, which are the comments before functions that explain the parameters and return types
	{
		'danymat/neogen',
		config = function()
			require("neogen").setup{
				enabled = true,
			}
			require("neogen").generate()
		end
	},

	-- shows vertical lines that line up how many indents over you are
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end
	},


	-- detects embedded code within other file types, i.e. CSS within HTML, so doing the comment motion will create a comment in the correct language
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- adds a few UNIX commands to nvim, notably :SudoWrite
	{"tpope/vim-eunuch"},

	-- massively improves nvim's syntax highlighting, in both speed and readability
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup{
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
					"query"
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true
				},
				build = ":TSUpdate"
			}
		end
	},

	-- makes folds cleaner
	{
		"lewis6991/cleanfold.nvim",
		config = function() 
			require("cleanfold").setup()
		end
	},

	-- makes it easier to align stuff ig
	{'junegunn/vim-easy-align'},

	-- gives a cheatsheet when running a command
	{
		'sudormrfbin/cheatsheet.nvim',
		requires = {
			{'nvim-telescope/telescope.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
	},
	-- the statusline on the bottom
	{
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true
		},
		config = function()
			require('lualine').setup{}
		end
	},

	-- neovim completion!

	-- tpope: Comments
	{
		'numToStr/Comment.nvim',
		opts = {
		},
		lazy = false,
	},

	-- markdown preview for notes
	{
		'iamcco/markdown-preview.nvim',
		run = 'cd app && yarn install'
	},

	-- adds the base-16 color schemes to nvim (catppuccin is included here)
	{'RRethy/nvim-base16'},

	-- highlights hex color codes in their respective color
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require'colorizer'.setup()
		end
	},
})
