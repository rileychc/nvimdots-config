local custom = {}
local map = vim.api.nvim_set_keymap

custom["jackMort/ChatGPT.nvim"] = {
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup()
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		map("n", "<leader>cg", "<Cmd>ChatGPT<CR>", { noremap = true, silent = true, desc = "ChatGPT" }),
		map(
			"n",
			"<leader>cx",
			"<Cmd>ChatGPTRun explain_code<CR>",
			{ noremap = true, silent = true, desc = "Explain Code" }
		),
		map(
			"n",
			"<leader>cx",
			"<Cmd>ChatGPTRun explain_code<CR>",
			{ noremap = true, silent = true, desc = "Explain Code" }
		),
		map(
			"v",
			"<leader>cx",
			"<Cmd>ChatGPTRun explain_code<CR>",
			{ noremap = true, silent = true, desc = "Explain Code" }
		),
	},
}
return custom
