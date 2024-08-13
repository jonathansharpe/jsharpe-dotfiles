
-- use this space for whatever colorscheme you are using this hour
return {
	'EdenEast/nightfox.nvim',
	lazy = false,
	name = "nightfox",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme nightfox
	end
}

