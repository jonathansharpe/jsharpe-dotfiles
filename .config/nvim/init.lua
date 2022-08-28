require('sharpe-plugins')
require'lspconfig'.html.setup({
	cmd = {
		"vscode-html-languageserver", "--stdio"
	}
})
require'lspconfig'.denols.setup{}
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.jsonls.setup({
	cmd = {
		"vscode-json-languageserver", "--stdio"
	}
})
require'lspconfig'.cssls.setup({})
require("nvim-tree").setup()
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
require("nvim-autopairs").setup{}
require("neogen").setup{
	enabled = true,
}

require("neogen").generate()
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
		"lua",
		"make",
		"markdown",
		"python",
		"regex",
		"rust",
		"rst",
	},
	highlight = {
		enable = true,
	},
}
require("spellsitter").setup()
require("indent_blankline").setup{
	show_current_context = true,
	show_current_context_start = true,
}
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
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
vim.cmd 'command! PS PackerSync'
vim.cmd 'set noexpandtab'
vim.cmd 'colorscheme base16-tokyo-night-dark'
vim.cmd 'set signcolumn=yes'
vim.g.mkdp_markdown_css = '~/.config/nvim/markdown-preview.css'
vim.g.mkdp_auto_close = 0
vim.g.mkdp_auto_start = 0
set.mouse = 'a'

-- CONFIG STUFF
-- may want to put the following in a separate file at some point idk
require("transparent").setup({
	-- enable = true,
})

-- STATUSLINE SETUP
-- plugin is feline.nvim
require'colorizer'.setup()
local components_feline = {}
require('feline').setup()
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- GENERAL REMAPS
map('n', '<A-t>', ':NvimTreeToggle<CR>', {silent = true})
map('n', '<A-T>', ':NvimTreeFocus<CR>', {silent = true})

-- COKELINE REMAPS
map('n', '<A-c>', '<Plug>(cokeline-focus-prev)', {silent = true})
map('n', '<A-v>', '<Plug>(cokeline-focus-next)', {silent = true})
map('n', '<A-x>', '<Plug>(cokeline-pick-close)', {silent = true})
map('n', '<A-f>', '<Plug>(cokeline-pick-focus)', {silent = true})

-- NVIM TREE REMAPS
vim.keymap.set('n', '<A-s>', require("nvim-tree.api").marks.navigate.select)

-- HOVER REMAPS
vim.keymap.set('n', 'K', require('hover').hover, {desc='hover.nvim'})

-- BUFFERLINE SETUP
-- plugin is cokeline.nvim
local get_hex = require('cokeline/utils').get_hex
local is_picking_close = require('cokeline/mappings').is_picking_close
local is_picking_focus = require('cokeline/mappings').is_picking_focus

require('cokeline').setup({
	default_hl = {
		fg = function(buffer)
			return
			buffer.is_focused
			and get_hex('Normal', 'fg')
			or get_hex('Comment', 'fg')
		end,
		bg = get_hex('ColorColumn', 'bg'),
	},

	components = {
		{
			text = ' ',
			bg = get_hex('Normal', 'bg'),
		},
		{
			text = '',
			fg = get_hex('ColorColumn', 'bg'),
			bg = get_hex('Normal', 'bg'),
		},
		{
			text = function(buffer)
				return
				(is_picking_focus() or is_picking_close())
				and buffer.pick_letter .. ' '
				or buffer.devicon.icon
			end,
			fg = function(buffer)
				return
				(is_picking_focus() and yellow)
				or (is_picking_close() and red)
				or buffer.devicon.color
			end,
			style = function(_)
				return
				(is_picking_focus() or is_picking_close())
				and 'italic,bold'
				or nil
			end,
		},
		{
			text = ' ',
		},
		{
			text = function(buffer) return buffer.filename .. '  ' end,
			style = function(buffer)
				return buffer.is_focused and 'bold' or nil
			end,
		},
		{
			text = '',
			delete_buffer_on_left_click = true,
		},
		{
			text = '',
			fg = get_hex('ColorColumn', 'bg'),
			bg = get_hex('Normal', 'bg'),
		},
	},
})

-- base00 = '#000000', base01 = '#404040', base02 = '#404040', base03 = '#808080',
-- base04 = '#808080', base05 = '#c0c0c0', base06 = '#c0c0c0', base07 = '#ffffff',
-- base08 = '#dd0907', base09 = '#ff6403', base0A = '#fbf305', base0B = '#1fb714',
-- base0C = '#02abea', base0D = '#0000d3', base0E = '#4700a5', base0F = '#90713a'
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
