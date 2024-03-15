local options = {
	-- 禁用鼠标
	mouse = false,
	-- relativenumber = false,
	autoindent = true,
	guicursor = "n:block-blinkon10,i-ci:ver15-blinkon10,c:hor15-blinkon10,v-sm:block,ve:ver15,r-cr-o:hor10", --光标闪烁方式
	cursorline = true, --在当前行添加光标行高亮效果
	-- cmdheight = 0,
	encoding = "utf-8",
	updatetime = 250, --设置自动命令的更新时间间隔为 250 毫秒。这决定了在文件更改后多久触发自动命令。
	list = true, --启用可见字符列表，用于显示制表符、行尾空格等特殊字符。
	wildignorecase = true, --在文件名自动补全中忽略大小写。
	-- colorcolumn = "100", --在列号 100 的位置显示垂直辅助线，用于帮助保持代码对齐。
	timeoutlen = 250, --设置在插入模式中按下 Esc 键后等待的时间长度，以毫秒为单位。
	ttimeoutlen = 10, --设置在插入模式中按下特殊键（如方向键）后等待的时间长度，以毫秒为单位。
	redrawtime = 1500, --设置自动重绘屏幕的时间限制，以毫秒为单位。超过此时间限制将停止自动重绘以提高性能。
	confirm = true, --使 Vim 在执行可能破坏性操作之前提示用户保存文件。
}
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0

return options
