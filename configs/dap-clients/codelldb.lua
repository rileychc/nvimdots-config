return function()
	local dap = require("dap")

	local utils = require("modules.utils.dap")

	-- local recent_projects = require("project_nvim").get_recent_projects() --project.nvim
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
	local grandparent_directory = vim.fn.fnamemodify(parent_directory, ":h")
	-- 去除再上一级目录末尾的斜杠
	grandparent_directory = grandparent_directory:gsub("[\\/]+$", "")

	local split_path = vim.split(cwd, "/")
	local project_name = split_path[#split_path]
	local current_filename = vim.fn.fnamemodify(current_file, ":t:r")
	local current_directory_name = vim.fn.fnamemodify(current_directory, ":t")

	local function get_debug_path()
		if cwd == "/Users/riley/Algorithm/Leetcode" then
			return vim.fn.input("Path to executable: ", current_directory .. "/bin/" .. "solution.out", "file")
		end
		if string.find(current_directory, "/Users/riley/Project") then
			return vim.fn.input(
				"Path to executable: ",
				cwd .. "/build/" .. project_name .. ".app/Contents/MacOS/" .. project_name,
				"file"
			)
		else
			return vim.fn.input(
				"Path to executable: ",
				current_directory .. "/bin/" .. current_filename .. ".out",
				"file"
			)
		end
	end

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			-- CHANGE THIS to your path!
			command = "codelldb",
			args = { "--port", "${port}" },
			-- detached = false,
		},
	}

	dap.adapters.lldb = {
		type = "executable",
		command = vim.fn.exepath("lldb-vscode"), -- Find lldb-vscode on $PATH
	}
	-- if string.find(current_directory, "/Users/riley/Project") then
	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			-- program = utils.input_exec_path(),
			cwd = "${workspaceFolder}",
			-- args = utils.input_args(),
			env = utils.get_env(),

			program = function()
				return get_debug_path()
			end,

			-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			runInTerminal = true,
		},
	}
	-- else
	-- 	dap.configurations.cpp = {
	-- 		{
	-- 			type = "codelldb",
	-- 			name = "C/C++",
	-- 			request = "launch",
	-- 			program = function()
	-- 				return get_debug_path()
	-- 			end,
	-- 			console = "integratedTerminal",
	-- 			cwd = "${workspaceFolder}",
	-- 			stopOnEntry = false,
	-- 			args = {},
	-- 			runInTerminal = false,
	-- 		},
	-- 	}
	-- end
	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
	dap.configurations.java = {
		{
			-- You need to extend the classPath to list your dependencies.
			-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
			-- classPaths = {},

			-- If using multi-module projects, remove otherwise.
			-- projectName = "yourProjectName",

			javaExec = "/opt/homebrew/Cellar/openjdk/21.0.1/libexec/openjdk.jdk/Contents/Home/bin/java",
			-- mainClass = "your.package.name.MainClassName",

			-- If using the JDK9+ module system, this needs to be extended
			-- `nvim-jdtls` would automatically populate this property
			-- modulePaths = {},
			name = "Launch YourClassName",
			request = "launch",
			type = "java",
		},
	}
end
