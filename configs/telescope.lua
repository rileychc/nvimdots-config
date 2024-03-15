local lga_actions = require("telescope-live-grep-args.actions")
return {
	extensions = {
		live_grep_args = {
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = function()
					return {
						["<C-k>"] = lga_actions.quote_prompt(),
						-- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),  --防止跟tab冲突
					}
				end,
			},
			frecency = function()
				return {
					use_sqlite = false,
					show_scores = true,
					show_unindexed = true,
					db_safe_mode = false, -- 删除最近的使用条目时，总会弹出提示
					ignore_patterns = { "*.git/*", "*/tmp/*" },
				}
			end,
		},
	},
}
