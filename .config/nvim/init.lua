vim.g.mapleader = " "
local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
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
require("lazy").setup("plugins")
local set = vim.opt
set.termguicolors = true
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
set.laststatus=2
set.showtabline=2
set.tw=70
-- ALIASES
vim.cmd 'set noexpandtab'
vim.cmd 'set signcolumn=yes'
vim.g.mkdp_markdown_css = '~/.config/nvim/markdown-preview.css'
vim.g.mkdp_auto_close = 0
vim.g.mkdp_auto_start = 0
set.mouse = 'a'
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

local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-- general maps
map('n', "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
map('n', "<C-n>", ":Neotree<CR>", opts)
map('n', "<Leader>1", ":Telescope buffers<CR>", opts)
map('n', "<Leader>2", ":Telescope telescope-tabs list_tabs<CR>", opts)
map('n', "<Leader><Tab>", ":lua require('nvim-window').pick()<CR>", opts)

-- telescope maps
local builtin = require("telescope.builtin")
map('n', "<C-p>", builtin.find_files, opts)
map('n', "<Leader>fg", builtin.live_grep, opts)
map('n', "<Leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
map('n', "<Leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opts)

-- treesj maps
map('n', "<Leader>j", ":lua require('treesj').toggle()<CR>", opts)

-- DAP maps
map('n', '<Leader><F2>', ":lua require('dap').toggle_breakpoint()<CR>", opts)
map('n', '<Leader><F3>', ":lua require('dap').step_into()<CR>", opts)
map('n', '<Leader><F4>', ":lua require('dap').step_over()<CR>", opts)
map('n', '<Leader><F5>', ":lua require('dap').continue()<CR>", opts)

map('n', '<A-c>', ':bprevious<CR>', {silent = true})
map('n', '<A-v>', ':bnext<CR>', {silent = true})
map('n', '<A-x>', ':bdelete<CR>', {silent = true})
