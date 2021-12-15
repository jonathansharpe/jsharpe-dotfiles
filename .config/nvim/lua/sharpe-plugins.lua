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
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq'
	}
	use {
		'ms-jpq/coq.artifacts',
		branch = 'artifacts'
	}
	use {
		'ms-jpq/coq.thirdparty',
		branch = '3p'
	}
	use {
		'tpope/vim-surround'
	}
    use { -- lualine
       'hoob3rt/lualine.nvim',
       requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {                                                         -- tpope: Comments
        'tpope/vim-commentary'
    }
    use { -- Icons for each entry in the completion menu
        "onsails/lspkind-nvim",
    }
    use { -- markdown preview for notes
       'iamcco/markdown-preview.nvim', 
       run = 'cd app && yarn install'
    }
    use { -- for LaTeX documents, might remove at some point
        'lervag/vimtex'
    }
    -- use {
    --     'vim-airline/vim-airline'
    -- }
    -- use {
    --     'vim-airline/vim-airline-themes'
    -- }
    use {                                                         -- code snippits
        "L3MON4D3/LuaSnip",
        -- "hrsh7th/vim-vsnip",
        -- "rafamadriz/friendly-snippets",
    }
    use { -- for deep ocean color scheme
        'marko-cerovac/material.nvim'
    }
    -- use { -- to make the window background transparent
    --     'xiyaowong/nvim-transparent'
    -- }
    use { -- highlights hex color codes in their respective color
        'norcalli/nvim-colorizer.lua'
    }
    use { -- Smooth Scrolling
        "karb94/neoscroll.nvim",
    }
    use {
        'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins'
    }
end)
