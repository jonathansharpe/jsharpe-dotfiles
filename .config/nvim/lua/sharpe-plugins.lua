local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

-- Packer, which is the plugin manager; 100% necessary, which is why it's required
return require('packer').startup(function()
	use { 'wbthomason/packer.nvim' }

local use = require('packer').use

-- shows what keys do what; e.g., press 'z' once and it'll show motions
use { "folke/which-key.nvim" }

-- pop-up with function parameter guide
use {"ray-x/lsp_signature.nvim"}

-- speeds up nvim load times
use {"lewis6991/impatient.nvim"}

-- an undo tree, to make it easier to go back without spamming Ctrl+R 100 times
use { "mbbill/undotree" }

-- adds transparency to nvim, only useful if the vim color scheme exact matches the terminal's
use { 'xiyaowong/nvim-transparent' }

-- bookmarks which add bookmarks
use { 'crusj/bookmarks.nvim',
	branch = 'main',
}

-- adds a fuzzy finder
use {
	"nvim-telescope/telescope.nvim", tag = '0.1.0',
	requires = {{'nvim-lua/plenary.nvim'}}
}

-- adds more matches to the % key when pressed
use {"andymass/vim-matchup"}

-- refactoring help
use {
	"ThePrimeagen/refactoring.nvim",
	requires = {
		{"nvim-lua/plenary.nvim"},
		{"nvim-treesitter/nvim-treesitter"},
	}
}

-- allows for light/dark theme syncing i think
use { 'RRethy/vim-illuminate' }

-- shows hover helps by pressing a key
use { 'lewis6991/hover.nvim', }

-- uses context-sensitive spell check, so the spell check doesn't tell you your variables are spelled wrong
use { 'lewis6991/spellsitter.nvim', }

-- bufferline plugin; not using at the moment
-- use {
-- 	'noib3/nvim-cokeline',
-- 	requires = 'kyazdani42/nvim-web-devicons',
-- 	config = function()
-- 		require('cokeline').setup()
-- 	end
-- }

-- tabline plugin
use {"alvarosevilla95/luatab.nvim", requires='kyazdani42/nvim-web-devicons'}

-- automatically create annotation templates, which are the comments before functions that explain the parameters and return types
use { 'danymat/neogen' }

-- shows vertical lines that line up how many indents over you are
use { "lukas-reineke/indent-blankline.nvim" }

-- shows signs for the changes in a text file located in a git repo
use { "lewis6991/gitsigns.nvim" }

-- makes loading files faster or something
use { "nathom/filetype.nvim" }

-- detects embedded code within other file types, i.e. CSS within HTML, so doing the comment motion will create a comment in the correct language
use { "JoosepAlviste/nvim-ts-context-commentstring" }

-- adds a few UNIX commands to nvim, notably :SudoWrite
use {"tpope/vim-eunuch"}

-- adds a pop-up terminal by pressing a keybind
use {"numToStr/FTerm.nvim"}

-- massively improves nvim's syntax highlighting, in both speed and readability
use {"nvim-treesitter/nvim-treesitter"}

-- shows a file tree tab on the side of the window
use {'kyazdani42/nvim-tree.lua'}

-- makes folds cleaner
use {"lewis6991/cleanfold.nvim"}

-- makes it easier to align stuff ig
use {'junegunn/vim-easy-align'}

-- adds fancy icons, necessary for basically any plugin that modifies the tabline or statusline
use { 'kyazdani42/nvim-web-devicons'}

-- gives a cheatsheet when running a command
use {
	'sudormrfbin/cheatsheet.nvim',
	requires = {
		{'nvim-telescope/telescope.nvim'},
		{'nvim-lua/popup.nvim'},
		{'nvim-lua/plenary.nvim'},
	}
}
-- the statusline on the bottom
use {'windwp/windline.nvim'}

-- i forgor :forgor:
use {'mattn/emmet-vim'}

use { -- neovim completion!
	'ms-jpq/coq_nvim',
	branch = 'coq'
}
use { -- a dependency for coq
	'ms-jpq/coq.artifacts',
	branch = 'artifacts'
}
-- for language servers, i.e. autosuggestions for programming languages, and syntax checking
use	{'neovim/nvim-lspconfig'}

-- completion menus
use {
	'ms-jpq/coq.thirdparty',
	branch = '3p'
}

-- creates a closing bracket when typing an opening one, and is context sensitive, etc.
use {'windwp/nvim-autopairs'}

-- tpope: Comments
use {'tpope/vim-commentary' }

-- Icons for each entry in the completion menu
use { "onsails/lspkind-nvim"}

-- markdown preview for notes
use {
	'iamcco/markdown-preview.nvim',
	run = 'cd app && yarn install'
}

-- code snippits
use {"L3MON4D3/LuaSnip"}

-- adds the base-16 color schemes to nvim
use {'RRethy/nvim-base16'}

-- highlights hex color codes in their respective color
use {'norcalli/nvim-colorizer.lua'}

-- smooth scrolling plugin
use { "karb94/neoscroll.nvim" }
-- google keep integration
use { 'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins' }
end)
