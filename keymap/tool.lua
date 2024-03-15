return {
	["i|<F5>"] = "",
	["t|<F5>"] = "",
	["n|<C-p>"] = "",
	["n|<F6>"] = "",
	["n|<F8>"] = "",
	["nv|<leader>ts"] = require("keymap.bind").map_cu("Translate"):with_noremap():with_silent():with_desc("Translate"),
	-- ["n|<leader>fe"] = "",
	-- ["n|<leader>fh"] = require("keymap.bind")
	-- 	.map_cu("Telescope oldfiles")
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("find: File by history"),

	["n|<leader>fR"] = require("keymap.bind")
		.map_cu("Telescope resume")
		:with_noremap()
		:with_silent()
		:with_desc("tool:  Resume by last"),

	-- ["n|<leader>bn"] = require("keymap.bind").map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),

	["n|<leader>fk"] = require("keymap.bind")
		.map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	-- local executable = "/Users/riley/Public/" .. vim.fn.fnamemodify(vim.fn.expand("%"), ":t:r") .. ".out"
	-- 			if vim.bo.filetype == ("cpp" or "c") then --判断该可调试文件是否存在，如果存在则调试，如果不存在则先编译后调试
	-- 				vim.cmd("!g++ -std=c++17  -Wall -o /Users/riley/Public/%:t:r.out  % -g -I ./include/ -I .. ")
	-- 				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
	-- 			end
	["n|<F5>"] = require("keymap.bind")
		.map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<S-F5>"] = require("keymap.bind")
		.map_callback(function()
			require("dap").terminate()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Stop"),
	["n|<F9>"] = require("keymap.bind")
		.map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F11>"] = require("keymap.bind")
		.map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<S-F11>"] = require("keymap.bind")
		.map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<F10>"] = require("keymap.bind")
		.map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),

	-- ["n|<A-S-t>"] = require("keymap.bind")
	-- 	.map_cr([[execute v:count . "ToggleTerm direction=horizontal"]])
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("terminal: Toggle horizontal"),
	-- ["i|<A-S-t>"] = require("keymap.bind")
	-- 	.map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>")
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("terminal: Toggle horizontal"),
	-- ["t|<A-S-t>"] = require("keymap.bind")
	-- 	.map_cmd("<Cmd>ToggleTerm<CR>")
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("terminal: Toggle horizontal"),
	["n|<M-\\>"] = require("keymap.bind")
		.map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["i|<M-\\>"] = require("keymap.bind")
		.map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<M-\\>"] = require("keymap.bind")
		.map_cmd("<Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	-- ["n|<M-\\>"] = "",
	-- ["i|<M-\\>"] = "",
	-- ["t|<M-\\>"] = "",
	["n|<C-\\>"] = require("keymap.bind")
		.map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["i|<C-\\>"] = require("keymap.bind")
		.map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<C-\\>"] = require("keymap.bind")
		.map_cmd("<Cmd>ToggleTerm<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["n|gt"] = "",
	["n|<leader>tt"] = require("keymap.bind")
		.map_cr("TroubleToggle")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Toggle trouble list"),

	-- ["n|<leader>fl"] = require("keymap.bind")
	-- 	.map_callback(function()
	-- 		require("cppman").open_cppman_for(vim.fn.expand("<cword>"))
	-- 	end)
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("CPPMan"),
	-- ["n|<leader>fL"] = require("keymap.bind").map_cr("CPPMan"):with_noremap():with_silent():with_desc("CppMan Library"),
}
