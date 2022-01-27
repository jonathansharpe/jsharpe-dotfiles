require('sharpe-plugins')
require'lspconfig'.html.setup{}
require'lspconfig'.denols.setup{}
require'lspconfig'.ltex.setup{}
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
vim.cmd 'colorscheme base16-eighties'
vim.g.mkdp_markdown_css = '/home/jonathansharpe/.config/nvim/markdown-preview.css'
vim.g.mkdp_auto_close = 0
set.mouse = 'a'

-- CONFIG STUFF
-- may want to put the following in a separate file at some point idk
require('feline').setup()
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<A-c>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<A-v>', ':BufferLineCycleNext<CR>', opts)
map('n', '<A-x>', ':BufferLinePickClose<CR>', opts)

require("bufferline").setup{
	options = {
		separator_style = "slant",
	}
}
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
