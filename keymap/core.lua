local global = require("core.global")
local cus = {}

cus["n|<c-s>"] = ""
cus["n|"] = ""
cus["nv|H"] = require("keymap.bind").map_cmd("^")
cus["nv|L"] = require("keymap.bind").map_cmd("g_")
if global.is_mac then
	cus["nv|<Esc><Esc>"] = require("keymap.bind").map_callback(function()
		vim.cmd(":silent :!/opt/homebrew/bin/im-select com.apple.keylayout.ABC")
	end)
end
-- cus["n|<C-q>"] = "",
-- cus["i|<C-q>"] = "",
-- cus["n|<A-S-q>"] = "",
-- cus["n|<A-q>"] = "",
-- cus["n|gw"] = require("keymap.bind").map_cmd("*N"):with_desc("Find current word"),
return cus
