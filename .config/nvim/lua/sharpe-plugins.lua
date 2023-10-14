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
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		}
	},

	-- shows what keys do what; e.g., press 'z' once and it'll show motions
	{ "folke/which-key.nvim" },

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

	-- adds catppuccin theme
	{
		"catppuccin/nvim",
		as = "catppuccin",
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
	{"ziontee113/icon-picker.nvim"},
	-- adds a startup screen
	{
		'goolord/alpha-nvim'
	},

	-- pop-up with function parameter guide
	{"ray-x/lsp_signature.nvim"},

	-- speeds up nvim load times
	{"lewis6991/impatient.nvim"},

	-- an undo tree, to make it easier to go back without spamming Ctrl+R 100 times
	{ "mbbill/undotree" },

	-- adds transparency to nvim, only ful if the vim color scheme exact matches the terminal's
	{ 'xiyaowong/nvim-transparent' },

	-- bookmarks which add bookmarks
	{ 
		'crusj/bookmarks.nvim',
		branch = 'main' 
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
		}
	},
	--  { '/nvim-treesitter/playground' }

	-- allows for light/dark theme syncing i think
	{ 'RRethy/vim-illuminate' },

	-- shows hover helps by pressing a key
	{ 'lewis6991/hover.nvim', },
	{'nanozuki/tabby.nvim'},

	-- automatically create annotation templates, which are the comments before functions that explain the parameters and return types
	{ 'danymat/neogen' },

	-- shows vertical lines that line up how many indents over you are
	{ "lukas-reineke/indent-blankline.nvim" },

	-- shows signs for the changes in a text file located in a git repo
	{ "lewis6991/gitsigns.nvim" },

	-- makes loading files faster or something
	{ "nathom/filetype.nvim" },

	-- detects embedded code within other file types, i.e. CSS within HTML, so doing the comment motion will create a comment in the correct language
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- adds a few UNIX commands to nvim, notably :SudoWrite
	{"tpope/vim-eunuch"},

	-- adds a pop-up terminal by pressing a keybind
	{"numToStr/FTerm.nvim"},

	-- massively improves nvim's syntax highlighting, in both speed and readability
	{"nvim-treesitter/nvim-treesitter"},

	-- makes folds cleaner
	{"lewis6991/cleanfold.nvim"},

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
	{'windwp/windline.nvim'},

	-- i forgor :forgor:
	{'mattn/emmet-vim'},

	{ -- neovim completion!
	'ms-jpq/coq_nvim',
	branch = 'coq'
},
{ -- a dependency for coq
'ms-jpq/coq.artifacts',
branch = 'artifacts'
},
-- for language servers, i.e. autosuggestions for programming languages, and syntax checking
{'neovim/nvim-lspconfig'},

-- completion menus
{
	'ms-jpq/coq.thirdparty',
	branch = '3p'
},

-- creates a closing bracket when typing an opening one, and is context sensitive, etc.
{'windwp/nvim-autopairs'},

-- tpope: Comments
{'tpope/vim-commentary' },

-- Icons for each entry in the completion menu
{ "onsails/lspkind-nvim"},

-- markdown preview for notes
{
	'iamcco/markdown-preview.nvim',
	run = 'cd app && yarn install'
},

-- code snippits
{"L3MON4D3/LuaSnip"},

-- adds the base-16 color schemes to nvim
{'RRethy/nvim-base16'},

-- highlights hex color codes in their respective color
{'norcalli/nvim-colorizer.lua'},

-- smooth scrolling plugin
{ "karb94/neoscroll.nvim" },
})
