local custom = {}

custom["chipsenkbeil/distant.nvim"] = { --翻译插件
	event = "VeryLazy",
	branch = "v0.3",
	config = function()
		require("distant"):setup()
	end,
}

return custom
