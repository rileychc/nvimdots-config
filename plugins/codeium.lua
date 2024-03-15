local custom = {}

custom["Exafunction/codeium.nvim"] = {
	event = "VeryLazy",
	-- lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({})
	end,
}

return custom
