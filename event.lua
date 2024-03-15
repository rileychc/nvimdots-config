local global = require("core.global")
local definitions = {}
local current_file = vim.fn.expand("%:p")
local cwd = vim.fn.getcwd()
-- 获取当前文件所在目录
local current_directory = vim.fn.fnamemodify(current_file, ":h")
-- 去除目录末尾的斜杠
current_directory = current_directory:gsub("[\\/]+$", "")
-- 获取当前文件所在目录的上一级目录
local parent_directory = vim.fn.fnamemodify(current_directory, ":h")
-- 去除上一级目录末尾的斜杠
parent_directory = parent_directory:gsub("[\\/]+$", "")
-- 获取当前文件所在目录的再上一级目录
local split_path = vim.split(cwd, "/")
local project_name = split_path[#split_path]
local current_filename = vim.fn.fnamemodify(current_file, ":t:r")
local current_directory_name = vim.fn.fnamemodify(current_directory, ":t")
-- 获取当前文件所在目录的再上一级目录
local grandparent_directory = vim.fn.fnamemodify(parent_directory, ":h")

-- 去除再上一级目录末尾的斜杠
grandparent_directory = grandparent_directory:gsub("[\\/]+$", "")
local m_build_dir
if cwd == "/Users/riley/Algorithm/Leetcode" then
	m_build_dir = grandparent_directory .. "/bin/"
else
	m_build_dir = current_directory .. "/bin/"
end

local uv = vim.loop
local function directoryExists(path)
	local stat = uv.fs_stat(path)
	return stat and stat.type == "directory"
end

function _G.binHas_Create_Directory() --如果bin目录不存在则创建它
	local path = m_build_dir
	if not directoryExists(path) then
		uv.fs_mkdir(path, 493) -- 493 is octal for 0755 permissions
	end
end
--一键编译c/cpp
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<S-F7>",
			"<ESC><cmd>lua binHas_Create_Directory()<CR><cmd>!g++  -g -std=c++17 -Wall -o "
				.. m_build_dir
				.. current_filename
				.. ".out " -- .. current_directory		-- .. "%:t:r.cpp"
				.. "-I"
				.. parent_directory
				.. " "
				.. current_file
				.. "<CR><CR>",
			{ silent = true, noremap = true }
		)
	end,
}) --./src/*.cpp

--一键运行代码文件

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		--  -D_GLIBCXX_DEBUG
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F7>",
			"<ESC>:w<CR>:lua binHas_Create_Directory()<CR><cmd>:split<CR>:te g++   -Wshadow -g -std=c++17 -Wall -o "
				.. m_build_dir
				.. current_filename
				.. ".out "
				.. "-I"
				.. parent_directory
				.. " "
				.. current_file
				.. " -D_GLIBCXX_DEBUG && time "
				.. m_build_dir
				.. current_filename
				.. ".out<CR>i", --%:t:r
			{ silent = true, noremap = true }
		)
	end,
})

--Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F7>",
			":w<CR>:split<CR>:te  time python3 % <CR>i",
			{ silent = true, noremap = true }
		)
	end,
})
--Java
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F7>",
			":w<CR>:split<CR>:te  time java % <CR>i",
			{ silent = true, noremap = true }
		)
	end,
})

-- vim.cmd([[
-- autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go exec ":call SetTitle()"
-- """定义函数SetTitle，自动插入文件头
-- " func SetTitle()
--     "如果文件类型为.sh文件
--     " if &filetype == 'sh'
--     "     call setline(1,"\#########################################################################")
--     "     call append(line("."),   "\# File Name:    ".expand("%"))
--     "     call append(line(".")+1, "\# Author:       rileychc")
--     "     call append(line(".")+2, "\# mail:         rileychc8@gmail.com")
--     "     call append(line(".")+3, "\# Created Time: ".strftime("%c"))
--     "     call append(line(".")+4, "\#########################################################################")
--     "     call append(line(".")+5, "\#!/bin/bash")
--     "     call append(line(".")+6, "")
--     " else
--     "     call setline(1, "/* ************************************************************************")
--     "     call append(line("."), "> File Name:     ".expand("%"))
--     "     call append(line(".")+1, "> Author:        rileychc")
--     "     call append(line(".")+2, "> mail:          rileychc8@gmail.com")
--     "     call append(line(".")+3, "> Created Time:  ".strftime("%c"))
--     "     call append(line(".")+4,   "> Copyright:")
--     "     call append(line(".")+5, "> Description:")
--     "     call append(line(".")+6, " ************************************************************************/")
--         " call append(line(".")+7, "")

--      " endif

--     "新建文件后，自动定位到文件末尾
-- endfunc
--     autocmd BufNewFile * normal G
-- ]])

vim.cmd([[
autocmd BufNewFile *.h,*.hpp exec ":call AddHHeader()"
func AddHHeader()
    let macro = "_".toupper(substitute(expand("%"), "[/.]", "_", "g"))."_"
    "normal o
    call setline(9, "#ifndef ".macro)
    call setline(10, "#define ".macro)
    call setline(11, "")
    call setline(12, "#endif  // ".macro)
endfunc
autocmd BufNewFile * normal G
]])
-- -- Leetcode
-- local api = vim.api

-- -- 定义一个全局变量来跟踪question.md的buffer ID
-- _G.question_md_buf = nil

-- -- 定义一个函数来处理solution.cpp文件的打开
-- local function open_question_md()
-- 	-- 获取当前打开的文件的完整路径
-- 	local file_path = api.nvim_buf_get_name(0)
-- 	-- 获取该文件所在的目录
-- 	local file_dir = vim.fn.fnamemodify(file_path, ":h")

-- 	-- 设置Neovim的当前工作目录为solution.cpp所在的目录
-- 	vim.fn.chdir(file_dir)

-- 	-- 构建question.md的路径
-- 	local question_md_path = file_dir .. "/question.md"

-- 	-- 检查question.md文件是否存在
-- 	if vim.fn.filereadable(question_md_path) == 1 then
-- 		-- 如果已经有一个question.md的buffer打开，先关闭它
-- 		if _G.question_md_buf and api.nvim_buf_is_loaded(_G.question_md_buf) then
-- 			-- 查找对应的窗口
-- 			local windows = api.nvim_list_wins()
-- 			for _, win in ipairs(windows) do
-- 				if api.nvim_win_get_buf(win) == _G.question_md_buf then
-- 					api.nvim_win_close(win, false)
-- 				end
-- 			end
-- 		end

-- 		-- 记录打开question.md前的当前窗口ID，以便之后可以切回来
-- 		local current_win = api.nvim_get_current_win()

-- 		-- 使用vsplit打开question.md
-- 		vim.cmd("vsplit " .. question_md_path)
-- 		-- 更新全局变量为新打开的buffer ID
-- 		_G.question_md_buf = api.nvim_get_current_buf()

-- 		-- 为新打开的question.md设置文件类型为markdown，以启用代码高亮
-- 		vim.cmd("set filetype=markdown")

-- 		-- 将光标移回之前的窗口（即solution.cpp）
-- 		api.nvim_set_current_win(current_win)
-- 	else
-- 		print("question.md not found in the directory of the current solution.cpp")
-- 	end
-- end

-- -- 设置autocmd监听BufEnter事件，当打开solution.cpp文件时执行函数
-- api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "solution.cpp",
-- 	callback = function(args)
-- 		-- 确保只对名为solution.cpp的文件执行操作
-- 		if vim.fn.fnamemodify(args.file, ":t") == "solution.cpp" then
-- 			open_question_md()
-- 		end
-- 	end,
-- })
-- -- Leetcode End

definitions["ft"] = {
	{ "FileType", "alpha", "set showtabline=0" },
	{ "FileType", "markdown", "set wrap" },
	{ "FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0" },
	{ "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
	{
		"FileType",
		"*",
		[[setlocal formatoptions-=cro]],
	},
	{
		"FileType",
		"c,cpp",
		"nnoremap <leader>h <Cmd>vsplit<CR><Cmd>SwitchSourceAndHeader<CR>",
	},
}
if global.is_mac then
	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			vim.cmd(":silent :!/opt/homebrew/bin/im-select com.apple.keylayout.ABC")
		end,
	})
	-- 防止进入的时候处于中文输入法
	vim.cmd(":silent :!/opt/homebrew/bin/im-select com.apple.keylayout.ABC")
end

return definitions
