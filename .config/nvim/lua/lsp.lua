local M = {}

-- lsp_signature >>>
M.signature = function()
   require "lsp_signature".setup()
   cfg = {
      Gse_lspsaga = true
   }
end -- <<<

-- lspinstall >>>
M.lspinstall = function() --
   local function setup_servers()
      require'lspinstall'.setup()
      local servers = require'lspinstall'.installed_servers()
      for _, server in pairs(servers) do
         require'lspconfig'[server].setup{}
      end
   end

   setup_servers()

   -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
   require'lspinstall'.post_install_hook = function ()
      setup_servers() -- reload installed servers
      vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
   end
end -- <<<

-- treesitter >>>
M.treesitter = function()
   require('nvim-treesitter.configs').setup {
      highlight = {
         enable = true, -- false will disable the whole extension
      },
      incremental_selection = {
         enable = true,
         keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
         },
      },
      indent = {
         enable = true,
      },
      textobjects = {
         select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
               -- You can use the capture groups defined in textobjects.scm
               ['af'] = '@function.outer',
               ['if'] = '@function.inner',
               ['ac'] = '@class.outer',
               ['ic'] = '@class.inner',
            },
         },
         move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
               [']m'] = '@function.outer',
               [']]'] = '@class.outer',
            },
            goto_next_end = {
               [']M'] = '@function.outer',
               [']['] = '@class.outer',
            },
            goto_previous_start = {
               ['[m'] = '@function.outer',
               ['[['] = '@class.outer',
            },
            goto_previous_end = {
               ['[M'] = '@function.outer',
               ['[]'] = '@class.outer',
            },
         },
      },
   }

   -- require'nvim-treesitter.configs'.setup {
   --    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
   --    --ignore_install = { "javascript", "java" }, -- List of parsers to ignore installing
   --    highlight = {
   --       enable = true,                     -- false will disable the whole extension
   --       -- disable = { "c", "rust" },   -- list of language that will be disabled
   --       -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
   --       -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
   --       -- Using this option may slow down your editor, and you may see some duplicate highlights.
   --       -- Instead of true it can also be a list of languages
   --       additional_vim_regex_highlighting = false,
   --    },
   --    indent = {
   --       enable = true
   --    }
   -- }
end -- <<<

-- cmp >>>
M.cmp = function()
   -- nvim-cmp supports additional completion capabilities
   local capabilities = vim.lsp.protocol.make_client_capabilities()
   capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

   -- luasnip setup
   local luasnip = require 'luasnip'

   -- nvim-cmp setup
   local cmp = require 'cmp'
   cmp.setup {
      snippet = {
         expand = function(args)
            require('luasnip').lsp_expand(args.body)
         end,
      },
      mapping = {
         ['<C-p>'] = cmp.mapping.select_prev_item(),
         ['<C-n>'] = cmp.mapping.select_next_item(),
         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
         ['<C-f>'] = cmp.mapping.scroll_docs(4),
         ['<C-Space>'] = cmp.mapping.complete(),
         ['<C-e>'] = cmp.mapping.close(),
         ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
         },
         ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
               fallback()
            end
         end,
         ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
               vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
               fallback()
            end
         end,
      },
      sources = {
         { name = 'path' },
         { name = 'buffer' },
         { name = 'calc' },
         { name = 'luasnip' },
         { name = 'nvim_lsp' },
         { name = 'nvim_lua' },
         { name = 'spell' },
         { name = 'treesitter' },
         { name = 'emoji' },
      },
      formatting = {
         format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
               path           = "[Path]",
               buffer         = "[Buffer]",
               calc           = "[Calc]",
               luasnip        = "[LuaSnip]",
               nvim_lsp       = "[LSP]",
               nvim_lua       = "[Lua]",
               spell          = "[Spell]",
               treesitter     = "[TS]",
            })[entry.source.name]
            return vim_item
         end,
      },
   }
end -- <<<

-- lspconfig >>>
M.lspconfig = function()
   local nvim_lsp = require('lspconfig')

   -- Use an on_attach function to only map the following keys
   -- after the language server attaches to the current buffer
   local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>',                                 opts)
      buf_set_keymap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>',                                  opts)
      buf_set_keymap('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>',                                       opts)
      buf_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>',                              opts)
      buf_set_keymap('n', '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>',                              opts)
      buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                        opts)
      buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                     opts)
      buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',  opts)
      buf_set_keymap('n', '<leader>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>',                             opts)
      buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',                                      opts)
      buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                                 opts)
      buf_set_keymap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>',                                  opts)
      buf_set_keymap('n', '<leader>e',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',                opts)
      buf_set_keymap('n', '[d',         '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',                            opts)
      buf_set_keymap('n', ']d',         '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',                            opts)
      buf_set_keymap('n', '<leader>q',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',                          opts)
      buf_set_keymap('n', '<leader>f',  '<cmd>lua vim.lsp.buf.formatting()<CR>',                                  opts)
   end

   -- Use a loop to conveniently call 'setup' on multiple servers and
   -- map buffer local keybindings when the language server attaches
   local servers = { 'clangd', 'html', 'denols', 'pylsp'}
   for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
         on_attach = on_attach,
         flags = {
            debounce_text_changes = 150,
         }
      }
   end
   require'lspconfig'.gopls.setup{}
end -- <<<

-- DAP: Debug Adapter Protocol >>>
M.dap = function()
   -- default keybinds
   vim.cmd [[
    nnoremap <silent> <leader>d<space> <cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <leader>dj  <cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <leader>dl  <cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <leader>dk  <cmd>lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>dbb <cmd>lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>dbc <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition<cmd> '))<CR>
    nnoremap <silent> <leader>dbl <cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message<cmd> '))<CR>
    nnoremap <silent> <leader>dp <cmd>lua require'dap'.run_last()<CR>
    nnoremap <silent> <leader>dr <cmd>lua require'dap'.repl.open()<CR>
   ]]
   -- vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
   vim.cmd "au FileType dap-repl lua require('dap.ext.autocompl').attach()"
   -- per-language config:
   local dap = require('dap')
   -- c++ dap congiguration >>>
   dap.configurations.cpp = {
      {
         name = "Launch file",
         type = "cppdbg",
         request = "launch",
         program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
         end,
         cwd = '${workspaceFolder}',
         stopOnEntry = true,
      },
   }
   dap.adapters.cppdbg = {
      type = 'executable',
      command = '/home/blake/.local/share/nvim/dapinstall/ccppr_vsc/extension/debugAdapters/bin/OpenDebugAD7',
   }
   -- <<<
end -- <<<

-- DAP installer >>>
M.dapinstall = function()
   local dap_install = require("dap-install")

   dap_install.setup({
      installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
   })
end -- <<<

return M

-- vim:fdm=marker:fmr=>>>,<<<:expandtab:tabstop=3:sw=3

