return {
	--会导致无法正常加载项目
	-- detection_methods = { "pattern", "lsp" },
	detection_methods = function()
		return { "pattern" }
	end,
	patterns = function()
		return { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "LC_IO.h" }
	end,
}
