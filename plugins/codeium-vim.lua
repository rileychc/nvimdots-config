local custom = {}

custom["Exafunction/codeium.vim"] = {
	event = "VeryLazy",
	config = function() --好中文补全不太好使
		-- vim.g.codeium_manual = true
		vim.g.codeium_enabled = false

		vim.g.codeium_disable_bindings = 1

		vim.keymap.set("i", "<C-e>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<C-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
		vim.keymap.set("i", "<C-p>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true })
		vim.keymap.set("i", "<C-S-e>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true })
	end,
}

return custom
