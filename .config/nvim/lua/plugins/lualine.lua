-- the statusline on the bottom
return {
	'nvim-lualine/lualine.nvim',
	config = function()
		require('lualine').setup{}
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true
		}
	end
}
