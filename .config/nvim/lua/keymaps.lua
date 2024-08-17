return {
	-- keymaps that do not require a plugin go here
	vim.keymap.set("n", "<A-c>", ":bprevious<CR>", { desc = "Previous Buffer" }),
	vim.keymap.set("n", "<A-v>", ":bnext<CR>", { desc = "Next Buffer" }),
	vim.keymap.set("n", "<A-x>", ":bdelete<CR>", { desc = "Close Buffer" }),

	-- keymaps that do require a plugin go here
	-- lsp keymaps
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" }),
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" }),
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" }),

	-- neogen keymaps
	vim.keymap.set("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", { desc = "Neogen" }),

	-- telescope buffers keymaps
	vim.keymap.set("n", "<Leader>1", ":Telescope buffers<CR>", { desc = "List Buffers in Telescope" }),
	vim.keymap.set("n", "<Leader>2", ":Telescope telescope-tabs list_tabs<CR>", { desc = "List Tabs in Telescope" }),

	-- window pick keymaps
	vim.keymap.set("n", "<Leader><Tab>", ":lua require('nvim-window').pick()<CR>", { desc = "Pick Window" }),

	-- treesj keymaps
	vim.keymap.set("n", "<Leader>j", ":lua require('treesj').toggle()<CR>", { desc = "Expand/Shrink function" }),

	-- dap maps
	vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" }),
	vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>", { desc = "Step Into" }),
	vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Step Over" }),
	vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue" }),

	-- program outline maps
	vim.keymap.set("n", "<Leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" }),

	-- none ls keymaps
	vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, { desc = "Format Code" }),
}
