local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
	-- Packer
	use { -- plugins
	'wbthomason/packer.nvim'
}
use {
	'windwp/nvim-autopairs',
	config = function() 
		require('nvim-autopairs').setup{}
	end
}
use {
	'noib3/nvim-cokeline',
	requires = 'kyazdani42/nvim-web-devicons',
	config = function()
		require('cokeline').setup()
	end
}
use {
	"numToStr/FTerm.nvim"
}
use {
	'junegunn/vim-easy-align'
}
use { -- adds fancy icons, necessary for basically any plugin that modifies the tabline or statusline
'kyazdani42/nvim-web-devicons'
}
use {
	'sudormrfbin/cheatsheet.nvim',
	requires = {
		{'nvim-telescope/telescope.nvim'},
		{'nvim-lua/popup.nvim'},
		{'nvim-lua/plenary.nvim'},
	}
}
use {
	'feline-nvim/feline.nvim'
}
-- use { -- for bufferline
-- 	'akinsho/bufferline.nvim',
-- 	requires = {'kyazdani42/nvim-web-devicons'}
-- }
use { -- neovim completion!
	'ms-jpq/coq_nvim',
	branch = 'coq'
}
use { -- a dependency for coq
	'ms-jpq/coq.artifacts',
	branch = 'artifacts'
}
use { -- for language servers, i.e. autosuggestions for programming languages, and syntax checking
	'neovim/nvim-lspconfig'
}
use {
	'ms-jpq/coq.thirdparty',
	branch = '3p'
}
use {
	'tpope/vim-surround'
}
use { -- tpope: Comments
'tpope/vim-commentary'
}
use { -- Icons for each entry in the completion menu
"onsails/lspkind-nvim"
}
use { -- markdown preview for notes
'iamcco/markdown-preview.nvim', 
run = 'cd app && yarn install'
}
use { -- code snippits
"L3MON4D3/LuaSnip",
-- "hrsh7th/vim-vsnip",
-- "rafamadriz/friendly-snippets",
}
use {
	'RRethy/nvim-base16'
}
-- use { -- to make the window background transparent
--     'xiyaowong/nvim-transparent'
-- }
use { -- highlights hex color codes in their respective color
'norcalli/nvim-colorizer.lua'
}
use { -- Smooth Scrolling
"karb94/neoscroll.nvim"
	}
	use { -- for google keep integration!
	'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins'
	}
end)
