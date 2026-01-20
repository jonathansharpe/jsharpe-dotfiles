return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			local lspkind = require "lspkind"
			lspkind.init{}
		end
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp"
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
						{ name = "buffer" },
					}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
					["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						},
						{ "i", "c" }
					),
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
			})

			local ls = require "luasnip"
			ls.config.set_config {
				history = false,
				updateevents = "TextChangedI,TextChangedP"
			}

			for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
				loadfile(ft_path)()
			end

			vim.keymap.set({ "i", "s" }, "<c-k>", function ()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<c-j>", function ()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })
		end,
	},
	-- pop-up with function parameter guide
	-- commenting this out for now to see if it's actually necessary
	-- with my other new plugins
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	config = function()
	-- 		require("lsp_signature").setup(cfg)
	-- 	end,
	-- },
	{
		-- automatically pairs brackets 'n stuff
		"altermo/ultimate-autopair.nvim",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		branch = "v0.6",
		opts = {
			-- config goes here
		},
	},
}
