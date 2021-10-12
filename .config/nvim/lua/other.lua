local M = {}

-- nvimtree >>>
M.nvimtree = function ()
   local tree_cb = require'nvim-tree.config'.nvim_tree_callback
   -- mappings
   -- [[
   local list = {
      { key = {"<CR>", "<2-LeftMouse>", "zo", "l"},   cb = tree_cb("edit") },
      { key = "J",                                    cb = tree_cb("cd") },
      { key = "K",                                    cb = tree_cb("dir_up") },
      { key = "vs",                                   cb = tree_cb("vsplit") },
      { key = "sp",                                   cb = tree_cb("split") },
      { key = "<C-t>",                                cb = tree_cb("tabnew") },
      { key = "<",                                    cb = tree_cb("prev_sibling") },
      { key = ">",                                    cb = tree_cb("next_sibling") },
      { key = "<M-lt>",                               cb = tree_cb("first_sibling") },
      { key = "<M->>",                                cb = tree_cb("last_sibling") },
      { key = "P",                                    cb = tree_cb("parent_node") },
      { key = {"<BS>", "h", "zc"},                    cb = tree_cb("close_node") },
      { key = "<S-CR>",                               cb = tree_cb("close_node") },
      { key = "<Tab>",                                cb = tree_cb("preview") },
      { key = "I",                                    cb = tree_cb("toggle_ignored") },
      { key = "H",                                    cb = tree_cb("toggle_dotfiles") },
      { key = "R",                                    cb = tree_cb("refresh") },
      { key = "o",                                    cb = tree_cb("create") },
      { key = "d",                                    cb = tree_cb("remove") },
      { key = "r",                                    cb = tree_cb("rename") },
      { key = "<C-r>",                                cb = tree_cb("full_rename") },
      { key = "x",                                    cb = tree_cb("cut") },
      { key = "c",                                    cb = tree_cb("copy") },
      { key = "p",                                    cb = tree_cb("paste") },
      { key = "y",                                    cb = tree_cb("copy_name") },
      { key = "Y",                                    cb = tree_cb("copy_path") },
      { key = "gy",                                   cb = tree_cb("copy_absolute_path") },
      { key = "g[",                                   cb = tree_cb("prev_git_item") },
      { key = "g]",                                   cb = tree_cb("next_git_item") },
      { key = "s",                                    cb = tree_cb("system_open") },
      { key = "q",                                    cb = tree_cb("close") },
      { key = "g?",                                   cb = tree_cb("toggle_help") },
   }
   -- ]]
   require'nvim-tree'.setup {
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_setup       = false,
      ignore_ft_on_setup  = {},
      update_to_buf_dir   = {
         enable = true,
         auto_open = true,
      },
      auto_close          = false,
      open_on_tab         = false,
      hijack_cursor       = false,
      update_cwd          = false,
      lsp_diagnostics     = false,
      update_focused_file = {
         enable      = false,
         update_cwd  = false,
         ignore_list = {}
      },
      system_open = {
         cmd  = nil,
         args = {}
      },
      view = {
         width = 30,
         height = 30,
         side = 'left',
         auto_resize = false,
         mappings = {
            custom_only = false,
            list = {}
         }
      }
   }
end -- <<<

-- toggleterm >>>
M.toggleterm = function()
   require("toggleterm").setup{
      -- size can be a number or function which is passed the current terminal
      size = function(term)
         if term.direction == "horizontal" then
            return 15
         elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
         end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      direction = 'float', -- vertical, horizontal, window, or float
      close_on_exit = true, -- close the terminal window when the process exits
      -- shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
         -- The border key is *almost* the same as 'nvim_open_win'
         -- see :h nvim_open_win for details on borders however
         -- the 'curved' border is a custom border type
         -- not natively supported but implemented in this plugin.
         border = 'curved', -- single, double, shadow, or curved
         width = 120,
         height = 32,
         winblend = 10, -- transparancy
         highlights = {
            border = "Normal",
            background = "Normal",
         }
      }
   }
end -- <<<

-- gitsigns >>>
M.gitsigns = function()
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
      keymaps = {
         -- Default keymap options
         noremap = true,

         ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
         ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

         ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
         ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
         ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',

         ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
         ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',

         ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
         ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

         ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
         ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
         ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

         -- Text objects
         ['o ih'] = '<cmd><C-U>lua require"gitsigns.actions".select_hunk()<CR>',
         ['x ih'] = '<cmd><C-U>lua require"gitsigns.actions".select_hunk()<CR>'
      },
      watch_index = {
         interval = 1000,
         follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
         virt_text = true,
         virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
         delay = 1000,
      },
      current_line_blame_formatter_opts = {
         relative_time = false
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
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
end -- <<<

-- neoscroll for smooth scrolling >>>
M.neoscroll = function()
   require('neoscroll').setup({
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
         '<C-y>', '<C-e>', 'zt', 'zz', 'zb',},
      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = 'sine',    -- use sine easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil,             -- Function to run after the scrolling animation ends
   })
end
-- <<<

-- Autosession >>>
M.autosession = function()
   local opts = {
      log_level = 'info',
      auto_session_enable_last_session = true,
      auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = false,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = nil,
   }
   require('auto-session').setup(opts)
   -- save some more things. notably options, resize, winpos, and terminal
   vim.o.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
   -- So I don't forget which one it is
   vim.cmd 'command! SessionSave    SaveSession'
   vim.cmd 'command! SessionDelete  DeleteSession'
   vim.cmd 'command! SessionRestore RestoreSession'
end -- <<<

return M

-- vim:fdm=marker:fmr=>>>,<<<:expandtab:tabstop=3:sw=3

