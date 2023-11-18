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

-- GENERAL REMAPS
map('n', "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
map('n', "<a-t>", ":Neotree<CR>", opts)
map('n', "<Leader><Tab>", ":JABSOpen<CR>", opts)


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

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)

