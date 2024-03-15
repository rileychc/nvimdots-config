local custom = {}
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
custom["Kohirus/cppassist.nvim"] = { --cpp辅助插件
	-- event = "VeryLazy",
	-- opt = true,
	ft = { "h", "cpp", "hpp", "c", "cc", "cxx" },
	config = function()
		require("cppassist").setup({
			-- For `SwitchSourceAndHeader`, `ImplementInSource` and `ImplementOutOfClass` command
			switch_sh = {
				-- Search for target files in the following directories
				include_dirs = { ".", ".." },
				-- Exclude the following directories when searching for target files
				exclude_dirs = {},
				-- If you want other flags, see `man fd`
				-- -t: This option can be specified more than once to include multiple file types.
				-- -s: Perform a case-sensitive search.
				-- -L: Using this flag, symbolic links are also traversed.
				search_flags = "-tf -s -L",
				-- If the return type contains the following keywords, the value of the right side will be used in the return statement
				return_type = {
					int = "0",
					short = "0",
					long = "0",
					char = "0",
					double = "0.0",
					float = "0.0",
					bool = "false",
					pointer = "nullptr",
				},
			},
			-- For `GotoHeaderFile` command
			goto_header = {
				include_dirs = { ".", "..", "/usr/include", "/usr/local/include", "~" },
				exclude_dirs = {},
				search_flags = "-tf -s",
			},
		})
	end,
	keys = {
		-- switch between source and header
		-- map("n", "<leader>h", "<Cmd>vsplit<CR><Cmd>SwitchSourceAndHeader<CR>", opts),
		-- goto the header file
		-- map("n", "<leader>gh", "<Cmd>GotoHeaderFile<CR>", opts),
		-- generate the function definition or static variable definition in source
		map(
			"n",
			"<leader>cf",
			"<Cmd>ImplementInSource<CR>",
			{ noremap = true, silent = true, desc = "Generate definition in source file" }
		),
		-- generate the function definition or static variable definition in source in visual mode
		map(
			"v",
			"<leader>cf",
			'<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>',
			{ noremap = true, silent = true, desc = "Generate definition in source file" }
		),
		-- generate the function definition or static variable definition in header
		map(
			"n",
			"<leader>cv",
			"<Cmd>ImplementOutOfClass<CR>",
			{ noremap = true, silent = true, desc = "Generate definition in header file" }
		),
	},
}
return custom
