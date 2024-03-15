local custom = {}

custom["mg979/vim-visual-multi"] = {
	event = "VeryLazy",
	-- lazy = true,
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<M-d>",
			["Find Subword Under"] = "<M-d>",
		}
	end,
}

return custom
