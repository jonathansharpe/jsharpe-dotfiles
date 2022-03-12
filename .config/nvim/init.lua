require('sharpe-plugins')
require'lspconfig'.html.setup{}
require'lspconfig'.denols.setup{}
-- require'lspconfig'.ltex.setup{}
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
vim.cmd 'set noexpandtab'
vim.cmd 'colorscheme base16-bespin'
vim.g.mkdp_markdown_css = '/home/jonathansharpe/.config/nvim/markdown-preview.css'
vim.g.mkdp_auto_close = 0
vim.g.mkdp_auto_start = 0
set.mouse = 'a'

-- CONFIG STUFF
-- may want to put the following in a separate file at some point idk
-- STATUSLINE SETUP
-- plugin is feline.nvim
local components_feline = {}
require('feline').setup()
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- GENERAL REMAPS
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', 'gj', 'j', opts)
map('n', 'gk', 'k', opts)

-- COKELINE REMAPS
map('n', '<A-c>', '<Plug>(cokeline-focus-prev)', {silent = true})
map('n', '<A-v>', '<Plug>(cokeline-focus-next)', {silent = true})
map('n', '<A-x>', '<Plug>(cokeline-pick-close)', {silent = true})

-- BUFFERLINE SETUP
-- plugin is cokeline.nvim
local is_picking_focus = require('cokeline/mappings').is_picking_focus
local is_picking_close = require('cokeline/mappings').is_picking_close
local get_hex = require('cokeline/utils').get_hex

local blue = vim.g.terminal_color_4
local gray = vim.g.terminal_color_8
local lightgray = vim.g.terminal_color_7
local lightblue = vim.g.terminal_color_6
local darkgray = get_hex('ColorColumn', 'bg')


local components_cokeline = {
	space = {
		text = ' ',
	},
	separator_left = {
		text = function(buffer)
			return buffer.index == 1 and '' or ''
		end,
		hl = {
			fg = function(buffer)
				return buffer.is_focused and darkgray or lightblue
			end,
			bg = function(buffer)
				return buffer.is_focused and lightblue or darkgray
			end,
		},
	},
	separator_right = {
		text = '',
		hl = {
			bg = function(buffer)
				return buffer.is_focused and darkgray or lightblue
			end,
			fg = function(buffer)
				return buffer.is_focused and lightblue or darkgray
			end,
		},
	},
	devicon = {
		text = function(buffer)
			return
			(is_picking_focus() or is_picking_close())
			and buffer.pick_letter .. ' '
			or buffer.devicon.icon
		end,
		hl = {
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
		}
	},
	index = {
		text = function(buffer)
			return buffer.index .. ': '
		end,
	},
	filename = {
		text = function(buffer) return buffer.filename .. '  ' end,
		hl = {
			style = function(buffer)
				return buffer.is_focused and 'bold' or nil
			end,
		}
	},
	close_button = {
		text = '',
		delete_buffer_on_left_click = true,
    },
}

require('cokeline').setup({
	default_hl = {
		focused = {
			fg = darkgray,
			bg = lightblue,
		},
		unfocused = {
			bg = darkgray,
			fg = lightblue,
		},
	},
	components = {
		components_cokeline.separator_left,
		components_cokeline.space,
		components_cokeline.devicon,
		components_cokeline.space,
		components_cokeline.index,
		components_cokeline.filename,
		components_cokeline.space,
		components_cokeline.separator_right,
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
