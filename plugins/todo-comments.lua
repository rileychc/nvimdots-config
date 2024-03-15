local custom = {}

custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	cmd = { "TodoTrouble", "TodoTelescope" },
	config = function()
		require("todo-comments").setup()
	end,
}

return custom
