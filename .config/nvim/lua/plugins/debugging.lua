return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			-- lua dap config
			dap.adapters["local-lua"] = {
				type = "executable",
				command = "local-lua-dbg",
				enrich_config = function(config, on_config)
					if not config["extensionPath"] then
						local c = vim.deepcopy(config)
						c.extensionPath = "/usr/bin/local-lua-dbg"
						on_config(c)
					else
						on_config(config)
					end
				end,
			}
			-- javascript dap support
			-- dap.adapters["pwa-node"] = {
			-- 	type = 'server',
			-- 	host = 'localhost',
			-- 	port = "${port}",
			-- 	executable = {
			-- 		command =
			-- 	}
			-- }
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		-- nice list of all the errors in your code
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		-- adds some motions for comments and stuff
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		-- shows breadcrumb-like things at the top so you know what file
		-- and function you're in
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		-- automatically create annotation templates, which are the comments before functions that explain the parameters and return types
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				enabled = true,
			})
			require("neogen").generate()
		end,
	},
	{
		-- shows vertical lines that line up how many indents over you are
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		-- highlights TODO: statements and stuff
		-- TODO:
		-- NOTE:
		-- HACK:
		-- FIX:
		-- WARNING:
		-- PERF:
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({})
		end,
	},
}
