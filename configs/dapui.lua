return {
	-- layouts = {
	-- 	{
	-- 		elements = {
	-- 			{ id = "scopes", size = 0.33 },
	-- 			{ id = "watches", size = 0.25 },
	-- 			{ id = "breakpoints", size = 0.17 },
	-- 			{ id = "stacks", size = 0.25 },
	-- 		},
	-- 		size = 0.33,
	-- 		position = "left",
	-- 	},
	-- 	{
	-- 		elements = {
	-- 			{ id = "console", size = 0.55 },
	-- 			{ id = "repl", size = 0.45 },
	-- 		},
	-- 		size = 0.27,
	-- 		position = "bottom",
	-- 	},
	-- },

	layouts = function()
		return {
			{
				elements = {
					-- Provide as ID strings or tables with "id" and "size" keys
					{
						id = "scopes",
						size = 0.3, -- Can be float or integer > 1
					},
					{ id = "watches", size = 0.3 },
					{ id = "stacks", size = 0.3 },
					{ id = "breakpoints", size = 0.1 },
				},
				size = 0.3,
				position = "left",
			},
			{
				elements = {
					{ id = "console", size = 0.55 },
					{ id = "repl", size = 0.45 },
				},
				position = "bottom",
				size = 0.25,
			},
		}
	end,
}
