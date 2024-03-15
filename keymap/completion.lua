local mappings = {}

-- Place global keymaps here.

-- NOTE: This function is special! Keymaps defined here are ONLY effective in buffers with LSP(s) attached
-- NOTE: Make sure to include `:with_buffer(buf)` to limit the scope of your mappings.
---@param buf number @The effective bufnr
mappings["lsp"] = function(buf)
	return {
		-- ["n|gto"] = "",
		-- ["n|<leader>fo"] = require("keymap.bind")
		-- 	.map_callback(function()
		-- 		require("telescope").extensions.aerial.aerial()
		-- 	end)
		-- 	:with_silent()
		-- 	:with_buffer(buf)
		-- 	:with_desc("lsp: Toggle outline in Telescope"),

		-- ["n|<leader>ci"] = "",
		-- ["n|<leader>co"] = "",
		-- ["n|<leader>ld"] = "",
		-- ["n|<leader>li"] = "",
		-- ["n|<leader>lr"] = "",
		-- ["n|gl"] = require("keymap.bind")
		-- 	.map_cr("Lspsaga show_line_diagnostics ++unfocus")
		-- 	:with_buffer(buf)
		-- 	:with_desc("lsp: Line diagnostic"),

		-- ["n|gp"] = require("keymap.bind")
		-- 	.map_cr("Lspsaga peek_definition")
		-- 	:with_buffer(buf)
		-- 	:with_desc("lsp: Preview definition"),
		-- ["n|gI"] = require("keymap.bind")
		-- 	.map_cr("Lspsaga incoming_calls")
		-- 	:with_buffer(buf)
		-- 	:with_desc("lsp: Show incoming calls"),
		-- ["n|gO"] = require("keymap.bind")
		-- 	.map_cr("Lspsaga outgoing_calls")
		-- 	:with_buffer(buf)
		-- 	:with_desc("lsp: Show outgoing calls"),
	}
end
mappings["plug_map"] = {
	-- ["n|<leader>ph"] = "",
	-- ["n|<leader>ps"] = "",
	-- ["n|<leader>pu"] = "",
	-- ["n|<leader>pi"] = "",
	-- ["n|<leader>pl"] = "",
	-- ["n|<leader>pc"] = "",
	-- ["n|<leader>pd"] = "",
	-- ["n|<leader>pp"] = "",
	-- ["n|<leader>pr"] = "",
	-- ["n|<leader>px"] = "",
	-- ["n|gps"] = "",
	-- ["n|gpl"] = "",
	-- ["n|gPs"] = require("keymap.bind").map_cr("G push"):with_noremap():with_silent():with_desc("git: Push"),
	-- ["n|gPl"] = require("keymap.bind").map_cr("G pull"):with_noremap():with_silent():with_desc("git: Pull"),
}
return mappings
