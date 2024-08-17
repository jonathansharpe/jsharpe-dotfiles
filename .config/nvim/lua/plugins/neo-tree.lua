-- adds file tree, very useful
return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
	},
	config = function ()
		vim.keymap.set('n', "<C-n>", ":Neotree position=float toggle=true<CR>", {})
	end
}
