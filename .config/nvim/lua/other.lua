local M = {}

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

