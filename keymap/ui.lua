return {
	-- ["n|<leader>bc"] = require("keymap.bind")
	-- 	.map_cr("BufDel")
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("buffer: Close current"),
	["n|<leader>|"] = require("keymap.bind").map_cr("vsplit"):with_noremap():with_silent():with_desc("Vsplit"),
	["n|<leader>-"] = require("keymap.bind").map_cr("split"):with_noremap():with_silent():with_desc("Split"),
}
