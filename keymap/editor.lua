return {
	["n|]t"] = require("keymap.bind")
		.map_callback(function()
			require("todo-comments").jump_next()
		end)
		:with_desc("Next todo comment"),
	["n|[t"] = require("keymap.bind")
		.map_callback(function()
			require("todo-comments").jump_prev()
		end)
		:with_desc("Previous todo comment"),
	["n|<leader>ft"] = require("keymap.bind").map_cu("TodoTelescope"):with_desc("Find Todo"),
	["n|<leader>fN"] = require("keymap.bind")
		.map_cr("Telescope notify")
		:with_silent()
		:with_noremap()
		:with_desc("Telescope Notify"),
	["n|<leader>C"] = require("keymap.bind")
		.map_callback(function()
			require("notify").dismiss({ silent = true, pending = true })
		end)
		:with_desc("Clear Notify"),
}
