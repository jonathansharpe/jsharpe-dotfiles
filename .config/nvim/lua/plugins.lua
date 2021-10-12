-- Load plugins
-- Bootstrap packer if needed {
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end
-- }

return require('packer').startup(function()
	-- Packer
	use {														 -- packer
		'wbthomason/packer.nvim'
	}

	-- Colors
	use {														 -- syntax highlighting
		'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
		config = function()
			require("lsp").treesitter()
		end,
	} 
-- use {-- -- -- -- -- -- -- -- -- -- -- -- -- --  -- onedark theme
-- -- 'navarasu/onedark.nvim',
-- -- config = function()
-- -- -- -- vim.g.onedark_transparent_background = true,
-- -- -- require('onedark').setup()
-- -- end
-- }
	use {														 	-- color tag highlighter
		'norcalli/nvim-colorizer.lua'
	}

	-- IDE features
	---- LSP
	use {														 -- lsp installer
		"kabouzeid/nvim-lspinstall",
		-- opt = true,
		-- setup = function()
		--	 require("other").packer_lazy_load "nvim-lspinstall"
		--	 -- reload the current file so lsp actually starts for it
		--	 vim.defer_fn(function()
		--		 vim.cmd "silent! e %"
		--	 end, 0)
		-- end,
	}
	use {														 -- DAP: Debug Adapter Protocol
		"mfussenegger/nvim-dap",
		config = function()
			require("lsp").dap()
		end
	}
	use {												 -- DAP adapter installer
		"Pocco81/DAPInstall.nvim",
		config = function()
			require("lsp").dapinstall()
		end
	}
	use {														 -- Default LSP configs
		"neovim/nvim-lspconfig",
		after = "nvim-lspinstall",
		config = function()
			require("lsp").lspconfig()
		end
	}
	use {														 -- Icons for each entry in the completion menu
		"onsails/lspkind-nvim",
	}
	use {														 -- compe
		"hrsh7th/nvim-cmp",
		config = function()
			require('lsp').cmp()
		end,
		requires = { -- nvim-cmp sources
			-- snippet integration
				-- "hrsh7th/cmp-vsnip",
				"saadparwaiz1/cmp_luasnip",

			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-latex-symbols",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-look",
		}
	}
	use {														 -- code snippits
		"L3MON4D3/LuaSnip",
		-- "hrsh7th/vim-vsnip",
		-- "rafamadriz/friendly-snippets",
	}
	use {														 -- function parameter previews
		"ray-x/lsp_signature.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lsp").signature()
		end,
	}
	use {														 -- Use the % key for more things
		"andymass/vim-matchup",
		-- setup = function()
		--	 require("other").packer_lazy_load "vim-matchup"
		-- end,
	}
	use {														 -- ALE: Support for lots of linters, etc
		'dense-analysis/ale',
		ft = {'sh', 'zsh', 'bash', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		config = function()
			vim.g.ale_disable_lsp = 1
		end
	}

	---- Other IDE features
	use {														 -- git integration
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('other').gitsigns()
		end,
	}
	use {														 -- file manager
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('other').nvimtree()
		end
	}
	use {														 -- terminal
		"akinsho/toggleterm.nvim",
		config = function()
			require('other').toggleterm()
		end
	}
	use {														 -- Smooth Scrolling
		"karb94/neoscroll.nvim",
		-- disable = not plugin_status.neoscroll,
		-- opt = true,
		-- config = function()
		--	 require("plugins.configs.others").neoscroll()
		-- end,
		-- setup = function()
		--	 require("core.utils").packer_lazy_load "neoscroll.nvim"
		-- end,
	}
	use {														 -- automatic session management
		'rmagatti/auto-session',
		config = function()
			require('other').autosession()
		end
	}
	use {
		'ellisonleao/glow.nvim',
		ft = { 'md', 'markdown', }
	}

	-- Conveniences
	use {														 -- Undo tree
		'mbbill/undotree',
		config = function()
			vim.cmd 'nnoremap <F5> <cmd>UndotreeToggle<CR>'
			vim.api.nvim_set_keymap("n", "<F5>", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true, })
		end
	}
	use {														 -- Quote pairing
		'jiangmiao/auto-pairs'
	}
	use {														 -- Alignment
		'junegunn/vim-easy-align',
	}
	use {														 -- tpope: Quote/parenthesis changing
		'tpope/vim-surround'
	}
	use {														 -- tpope: Comments
		'tpope/vim-commentary'
	}
	use {														 -- tpope: git integration
		'tpope/vim-fugitive'
	}
	use {														 -- tpope: Repeatability for various tpope plugins
		'tpope/vim-repeat'
	}
	 -- sharpe's plugins
	 use {
		  'lervag/vimtex'
	 }
   use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
   }
   use {
      'iamcco/markdown-preview.nvim', 
      run = 'cd app && yarn install', 
      cmd = 'MarkdownPreview'
   }

   -- IDE features
   ---- LSP
   use {                                           -- lsp installer
      "kabouzeid/nvim-lspinstall",
      -- opt = true,
      -- setup = function()
      --    require("other").packer_lazy_load "nvim-lspinstall"
      --    -- reload the current file so lsp actually starts for it
      --    vim.defer_fn(function()
      --       vim.cmd "silent! e %"
      --    end, 0)
      -- end,
   }
   use {                                           -- DAP: Debug Adapter Protocol
      "mfussenegger/nvim-dap",
      config = function()
         require("lsp").dap()
      end
   }
   use {                                     -- DAP adapter installer
      "Pocco81/DAPInstall.nvim",
      config = function()
         require("lsp").dapinstall()
      end
   }
   use {                                           -- Default LSP configs
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      config = function()
         require("lsp").lspconfig()
      end
   }
   use {                                           -- Icons for each entry in the completion menu
      "onsails/lspkind-nvim",
   }
   use {                                           -- compe
      "hrsh7th/nvim-cmp",
      config = function()
         require('lsp').cmp()
      end,
      requires = { -- nvim-cmp sources
         "saadparwaiz1/cmp_luasnip", --luasnip integration
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-nvim-lua",
         "hrsh7th/cmp-latex-symbols",
         "hrsh7th/cmp-emoji",
         "hrsh7th/cmp-calc",
         "hrsh7th/cmp-look",
      }
   }
   use {                                           -- code snippits
      "L3MON4D3/LuaSnip",
      -- "hrsh7th/vim-vsnip",
      -- "rafamadriz/friendly-snippets",
   }
   use {                                           -- function parameter previews
      "ray-x/lsp_signature.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("lsp").signature()
      end,
   }
   use {                                           -- Use the % key for more things
      "andymass/vim-matchup",
      -- setup = function()
      --    require("other").packer_lazy_load "vim-matchup"
      -- end,
   }
   use {                                           -- ALE: Support for lots of linters, etc
      'dense-analysis/ale',
      ft = {'sh', 'zsh', 'bash', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
      config = function()
         vim.g.ale_disable_lsp = 1
      end
   }

   ---- Other IDE features
   use {                                           -- git integration
      'lewis6991/gitsigns.nvim',
      requires = {
         'nvim-lua/plenary.nvim'
      },
      config = function()
         require('other').gitsigns()
      end,
   }
   use {                                           -- file manager
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
         require('other').nvimtree()
      end
   }
   use {                                           -- terminal
      "akinsho/toggleterm.nvim",
      config = function()
         require('other').toggleterm()
      end
   }
   use {                                           -- Smooth Scrolling
      "karb94/neoscroll.nvim",
      config = function()
         require('other').neoscroll()
      end,
   }
   use {                                           -- automatic session management
      'rmagatti/auto-session',
      config = function()
         require('other').autosession()
      end
   }
   use {                                           -- Markdown preview
      'ellisonleao/glow.nvim',
      ft = { 'md', 'markdown', }
   }

   -- Conveniences
   use {                                           -- Undo tree
      'mbbill/undotree',
      config = function()
         vim.cmd 'nnoremap <F5> <cmd>UndotreeToggle<CR>'
         vim.api.nvim_set_keymap("n", "<F5>", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true, })
      end
   }
   use {                                           -- Quote pairing
      'jiangmiao/auto-pairs'
   }
   use {                                           -- Alignment
      'junegunn/vim-easy-align',
   }
   use {                                           -- tpope: Quote/parenthesis changing
      'tpope/vim-surround'
   }
   use {                                           -- tpope: Comments
      'tpope/vim-commentary'
   }
   use {                                           -- tpope: git integration
      'tpope/vim-fugitive'
   }
   use {                                           -- tpope: Repeatability for various tpope plugins
      'tpope/vim-repeat',
   }
   use {                                           -- cheat.sh integration
      "dbeniamine/cheat.sh-vim",
   }
end)

-- vim:fdm=marker:fmr={,}:expandtab:tabstop=3:sw=3

