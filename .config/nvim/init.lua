local set = vim.opt
-- Set the behavior of tab
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.number = true
set.relativenumber = true
set.spell = true
set.spelllang = 'en_us'
set.fdm = 'indent'
set.termguicolors = true
set.laststatus=2
set.showtabline=2
-- ALIASES
vim.cmd 'set noexpandtab'
vim.cmd 'set signcolumn=yes'
vim.g.mkdp_markdown_css = '~/.config/nvim/markdown-preview.css'
vim.g.mkdp_auto_close = 0
vim.g.mkdp_auto_start = 0
vim.g.mapleader = " "
set.mouse = 'a'
require('sharpe-plugins')
vim.cmd 'colorscheme catppuccin-mocha'
require'lspconfig'.html.setup({
	cmd = {
		"vscode-html-languageserver", "--stdio"
	}
})
require'lspconfig'.denols.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.ltex.setup{}
require'lspconfig'.jsonls.setup({
	cmd = {
		"vscode-json-languageserver", "--stdio"
	}
})
require'lspconfig'.marksman.setup{}
require'lspconfig'.clangd.setup{}
require('alpha').setup(require'alpha.themes.startify'.config)
require("bookmarks").setup()
require'lspconfig'.cssls.setup({})
-- require("nvim-tree").setup()
-- require('nnn').setup()
require("cleanfold").setup()
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
require("which-key").setup{}
require("icon-picker").setup({
	disable_legacy_commands = true
})
require("nvim-autopairs").setup{}
require("neogen").setup{
	enabled = true,
}
require("neogen").generate()
require("lsp_signature").setup(cfg)
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
require('tabby.tabline').use_preset('active_wins_at_tail', {
	theme = {
		fill = 'Visual', -- tabline background
		tab = 'StatusLine',
		win = 'StatusLine',
		head = 'StatusLine',
		tail = 'StatusLine',
	},
	nerdfont = true, -- whether use nerdfont
	buf_name = {
		mode = "'unique'|'relative'|'tail'|'shorten'",
	},
})
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
-- require("spellsitter").setup{
-- 	enable = true,
-- }
-- require('luatab').setup{}
require("ibl").setup()
local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = 'lldb'
}
dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}
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
vim.g.coq_settings = {
	auto_start = 'shut-up'
}
local coq = require "coq"
-- lsp.html.setup(coq.lsp_ensure_capabilities())
-- require('lspconfig').pylsp.setup{}
-- require('lspconfig/prolog_lsp')
-- require('lspconfig').prolog_lsp.setup{}

-- CONFIG STUFF
-- may want to put the following in a separate file at some point idk
require("transparent").setup({
	-- enable = true,
})

-- STATUSLINE SETUP
-- plugin is windline.nvim
local windline = require('windline')
require('wlsample.bubble')
-- windline.setup({
-- 	statuslines = {
-- 	}
-- })

require'colorizer'.setup()
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- GENERAL REMAPS
map('n', "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
map('n', "<a-t>", ":Neotree<CR>", opts)


-- REFACTORING KEYMAPS
-- let mapleader = " "

-- HOVER REMAPS
vim.keymap.set('n', '<Leader>K', require('hover').hover, {desc='hover.nvim'})

-- DAP KEYMAPS
vim.keymap.set('n', '<Leader><F2>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader><F3>', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader><F4>', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader><F5>', function() require('dap').continue() end)

map('n', '<A-c>', ':bprevious<CR>', {silent = true})
map('n', '<A-v>', ':bnext<CR>', {silent = true})
map('n', '<A-x>', ':bdelete<CR>', {silent = true})

require'FTerm'.setup({
	cmd = "zsh"
})
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)

require('neoscroll').setup({
	mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
	'<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
	hide_cursor = true,          -- Hide cursor while scrolling
	stop_eof = true,             -- Stop at <EOF> when scrolling downwards
	use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
	respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil,        -- Default easing function
	pre_hook = nil,              -- Function to run before the scrolling animation starts
	post_hook = nil,              -- Function to run after the scrolling animation ends
})
