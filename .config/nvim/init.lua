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
set.tw=70
-- ALIASES
vim.cmd 'set noexpandtab'
vim.cmd 'set signcolumn=yes'
vim.g.mkdp_markdown_css = '~/.config/nvim/markdown-preview.css'
vim.g.mkdp_auto_close = 0
vim.g.mkdp_auto_start = 0
vim.g.mapleader = " "
set.mouse = 'a'
require('sharpe-plugins')
vim.cmd [[colorscheme nightfox]]
require'lspconfig'.html.setup({
	cmd = {
		"vscode-html-languageserver", "--stdio"
	}
})
require'lspconfig'.denols.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.bashls.setup{}
-- require'lspconfig'.ltex.setup{}
require'lspconfig'.jsonls.setup({
	cmd = {
		"vscode-json-languageserver", "--stdio"
	}
})
require'lspconfig'.marksman.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cssls.setup({})
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('renderer', wilder.renderer_mux({
	[':'] = wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(),
	}),
	['/'] = wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(),
	}),
	['?'] = wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(),
	})
}))
wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		highlights = {
			border = 'Normal',
		},
		border = 'rounded'
	})
))
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
vim.g.coq_settings = {
	auto_start = 'shut-up'
}
require("coq")
vim.cmd 'COQnow -s'


local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- general maps
map('n', "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
map('n', "<Leader>t", ":Neotree<CR>", opts)
map('n', "<Leader>1", ":Telescope buffers<CR>", opts)
map('n', "<Leader>2", ":Telescope telescope-tabs list_tabs<CR>", opts)
map('n', "<Leader><Tab>", ":lua require('nvim-window').pick()<CR>", opts)


-- telescope maps
-- local builtin = require('telescope.builtin')
map('n', "<Leader><Leader>", ":lua require('telescope.builtin').find_files()<CR>", opts)
map('n', "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
map('n', "<Leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
map('n', "<Leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opts)

-- treesj maps
map('n', "<Leader>j", ":lua require('treesj').toggle()<CR>", opts)

-- hover maps
map('n', '<Leader>K', ":lua require('hover').hover()<CR>", {desc='hover.nvim'})

-- DAP maps
map('n', '<Leader><F2>', ":lua require('dap').toggle_breakpoint()<CR>", opts)
map('n', '<Leader><F3>', ":lua require('dap').step_into()<CR>", opts)
map('n', '<Leader><F4>', ":lua require('dap').step_over()<CR>", opts)
map('n', '<Leader><F5>', ":lua require('dap').continue()<CR>", opts)

map('n', '<A-c>', ':bprevious<CR>', {silent = true})
map('n', '<A-v>', ':bnext<CR>', {silent = true})
map('n', '<A-x>', ':bdelete<CR>', {silent = true})

map('n', '<A-i>', ':lua require("FTerm").toggle()<CR>', opts)
