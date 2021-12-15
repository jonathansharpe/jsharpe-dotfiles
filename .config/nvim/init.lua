require('sharpe-plugins')
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
require("bufferline").setup{}
vim.cmd 'set noexpandtab'
vim.g.material_style = 'deep ocean'
vim.cmd 'colorscheme material'
--vim.g.mkdp_markdown_css = '/home/jonathansharpe/.config/nvim/markdown-preview.css'
set.mouse = 'a'
	require'lualine'.setup {
		options = {
			icons_enabled = true,
			theme = 'material-nvim',
			component_separators = {'', ''},
			section_separators = {'', ''},
			disabled_filetypes = {}
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch'},
			lualine_c = {'filename'},
			lualine_x = {'encoding', 'fileformat', 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		extensions = {}
	}
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
-- require("transparent").setup({
--   enable = false, -- boolean: enable transparent
--   extra_groups = { -- table/string: additional groups that should be clear
--     -- In particular, when you set it to 'all', that means all avaliable groups

--     -- example of akinsho/nvim-bufferline.lua
--     "BufferLineTabClose",
--     "BufferlineBufferSelected",
--     "BufferLineFill",
--     "BufferLineBackground",
--     "BufferLineSeparator",
--     "BufferLineIndicatorSelected",
--   },
--   exclude = {}, -- table: groups you don't want to clear
-- })
