return { 
	"ellisonleao/gruvbox.nvim", 
	priority = 1000, 
	lazy = false,
	config = function()
		vim.cmd([[colorscheme gruvbox]])
	end,
}
