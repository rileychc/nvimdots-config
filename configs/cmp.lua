-- local lga_actions = require("telescope-live-grep-args.actions")
return {
	-- extensions = {
	-- 	live_grep_args = {
	-- 		-- define mappings, e.g.
	-- 		mappings = { -- extend mappings
	-- 			i = function()
	-- 				return {
	-- 					-- ["<C-k>"] = lga_actions.quote_prompt(),
	-- 					-- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),  --防止跟tab冲突
	-- 				}
	-- 			end,
	-- 		},
	-- 	},
	-- },

	sources = function()
		return {
			{ name = "nvim_lsp", max_item_count = 350 },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "orgmode" },
			{ name = "buffer" },
			{ name = "latex_symbols" },
			{ name = "copilot" },
			-- { name = "codeium" },
			-- { name = "cmp_tabnine" },
		}
	end,
}
