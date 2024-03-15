local global = require("core.global")
local cus = {}

-- cus["n|gC"] = require("keymap.bind")
-- 	.map_cr("CodeiumEnable")
-- 	:with_noremap()
-- 	:with_silent()
-- 	:with_desc("tool: CodeiumEnable"),
if global.is_mac then
	cus["n|<leader>mi"] =
		require("keymap.bind").map_cr("Pastify"):with_noremap():with_silent():with_desc("tool:Markdown Image Insert")
	cus["n|<leader>md"] = require("keymap.bind")
		.map_cr("MarkdownPreviewToggle")
		:with_noremap()
		:with_silent()
		:with_desc("tool: Preview markdown")
end
return cus
