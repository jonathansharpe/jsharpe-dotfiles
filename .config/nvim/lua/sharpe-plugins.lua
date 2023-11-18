local fn = vim.fn
local lazypath = fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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

	-- use this space for whatever colorscheme you are using this hour
	{
		'EdenEast/nightfox.nvim'
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
		'matbme/JABS.nvim',
		config = function()
			require'jabs'.setup{}
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
	{
		'camspiers/snap',
		config = function()
			local snap = require"snap"
			snap.maps {
				{"<Leader><Leader>", snap.config.file { producer = "fd.file"} },
			}
		end
	},

	-- adds a window picker
	{
		's1n7ax/nvim-window-picker',
		name = 'window-picker',
		event = 'VeryLazy',
		version = '2.*',
		config = function()
			require'window-picker'.setup()
		end,
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
		"nvim-telescope/telescope.nvim", tag = '0.1.0',
		requires = {{'nvim-lua/plenary.nvim'}}
	},

	-- adds more matches to the % key when pressed
	{"andymass/vim-matchup"},

	-- refactoring help
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-treesitter/nvim-treesitter"},
		},
		config = function()
			require('refactoring').setup({
				prompt_func_return_type = {
					go = false,
					java = false,

					cpp = false,
					c = false,
					h = false,
					hpp = false,
					cxx = false,
				},
				prompt_func_param_type = {
					go = false,
					java = false,

					cpp = false,
					c = false,
					h = false,
					hpp = false,
					cxx = false,
				},
				printf_statements = {},
				print_var_statements = {},
			})
		end
	},

	-- highlights matching word under the cursor
	-- { 'RRethy/vim-illuminate' },

	-- shows hover helps by pressing a key
	{
		'lewis6991/hover.nvim',
		config = function()
			require('hover').setup{
				init = function()
					-- Require providers
					require('hover.providers.lsp')
					-- require('hover.providers.gh')
					-- require('hover.providers.man')
					-- require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = nil
				},
				title = true
			}
		end
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
	-- 	'nanozuki/tabby.nvim',
	-- 	config = function()
	-- 		require('tabby.tabline').use_preset('active_wins_at_tail', {
	-- 			theme = {
	-- 				fill = 'Visual', -- tabline background
	-- 				tab = 'StatusLine',
	-- 				win = 'StatusLine',
	-- 				head = 'StatusLine',
	-- 				tail = 'StatusLine',
	-- 			},
	-- 			nerdfont = true, -- whether use nerdfont
	-- 			buf_name = {
	-- 				mode = "'unique'|'relative'|'tail'|'shorten'",
	-- 			},
	-- 		})
	-- 	end
	-- },

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

	-- shows signs for the changes in a text file located in a git repo
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup {
				signs = {
					add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
					change       = {hl = 'GitSignsChange', text = '*', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
					delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
					topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
					changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
				},
				signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 1000,
					follow_files = true
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
				yadm = {
					enable = false
				},
			}
		end
	},

	-- makes loading files faster or something
	-- { "nathom/filetype.nvim" },

	-- detects embedded code within other file types, i.e. CSS within HTML, so doing the comment motion will create a comment in the correct language
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- adds a few UNIX commands to nvim, notably :SudoWrite
	{"tpope/vim-eunuch"},

	-- adds a pop-up terminal by pressing a keybind
	{
		"numToStr/FTerm.nvim",
		config = function()
			require'FTerm'.setup({
				cmd = "zsh"
			})
		end
	},

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

	-- adds fancy icons, necessary for basically any plugin that modifies the tabline or statusline

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

	-- {
	-- 	'echasnovski/mini.completion',
	-- 	version = false,
	-- 	config = function()
	-- 		require('mini.completion').setup()
	-- 	end
	-- },
	{
		'ms-jpq/coq_nvim',
		branch = 'coq',
		config = function ()
			require("coq")
		end
	},
	-- a dependency for coq
	{
		'ms-jpq/coq.artifacts',
		branch = 'artifacts'
	},
	-- completion menus
	{
		'ms-jpq/coq.thirdparty',
		branch = '3p'
	},
	-- for language servers, i.e. autosuggestions for programming languages, and syntax checking
	{
		'neovim/nvim-lspconfig'
	},

	-- creates a closing bracket when typing an opening one, and is context sensitive, etc.
	{
		'windwp/nvim-autopairs',
		config = function()
			require("nvim-autopairs").setup{}
		end
	},

	-- tpope: Comments
	{
		'numToStr/Comment.nvim',
		opts = {
		},
		lazy = false,
	},

	-- Icons for each entry in the completion menu
	{ "onsails/lspkind-nvim"},

	-- markdown preview for notes
	{
		'iamcco/markdown-preview.nvim',
		run = 'cd app && yarn install'
	},

	-- code snippets
	{"L3MON4D3/LuaSnip"},

	-- adds the base-16 color schemes to nvim (catppuccin is included here)
	{'RRethy/nvim-base16'},

	-- highlights hex color codes in their respective color
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require'colorizer'.setup()
		end
	},

	{
		'declancm/cinnamon.nvim',
		config = function()
			require('cinnamon').setup()
			vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
			vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
			vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
			vim.keymap.set('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
			vim.keymap.set('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")
		end
	},

	-- smooth scrolling plugin
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	config = function()
	-- 		require('neoscroll').setup({
	-- 			mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
	-- 			'<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
	-- 			hide_cursor = true,          -- Hide cursor while scrolling
	-- 			stop_eof = true,             -- Stop at <EOF> when scrolling downwards
	-- 			use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
	-- 			respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	-- 			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	-- 			easing_function = nil,        -- Default easing function
	-- 			pre_hook = nil,              -- Function to run before the scrolling animation starts
	-- 			post_hook = nil,              -- Function to run after the scrolling animation ends
	-- 		})
	-- 	end
	-- },
})
