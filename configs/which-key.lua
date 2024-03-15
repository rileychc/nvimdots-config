local keymaps = {
	mode = { "n", "v" },
	["gP"] = { name = "+Push/Pull" },
	["<leader>f"] = { name = "+Telescope" },
	["<leader>n"] = { name = "+NvimTree" },
	["<leader>d"] = { name = "+Debug" },
	["<leader>b"] = { name = "+Buffer" },
	["<leader>t"] = { name = "+Trouble" },
	["<leader>s"] = { name = "+Session" },
	-- ["<leader>h"] = { name = "+Hunk" },
	["<leader>p"] = { name = "+Lazy" },
	["<leader>c"] = { name = "+Calls" },
	["<leader>l"] = { name = "+Lsp" },
	["<leader>m"] = { name = "+Markdown" },
}
return { require("which-key").register(keymaps) }
