return function()
	local nvim_lsp = require("lspconfig")
	require("completion.mason").setup()
	require("completion.mason-lspconfig").setup()

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	-- Setup lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
	if vim.fn.executable("dart") == 1 then
		local ok, _opts = pcall(require, "user.configs.lsp-servers.dartls")
		if not ok then
			_opts = require("completion.servers.dartls")
		end
		local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
		nvim_lsp.dartls.setup(final_opts)
	end
	--配置ccls
	local root_files = {
		"compile_commands.json",
		".ccls",
	}
	require("lspconfig").ccls.setup({
		cmd = { "ccls" },
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(unpack(root_files))(fname)
				or require("lspconfig.util").find_git_ancestor(fname)
		end,
		offset_encoding = "utf-16",
		-- ccls does not support sending a null root directory
		single_file_support = false,

		init_options = {
			--该选项为compile_commands.json的路径
			-- compilationDatabaseDirectory = "build",
			index = {
				threads = 0,
			},
			clang = {
				excludeArgs = { "-frounding-math" },
			},
		},
	})

	-- ccls  End
	pcall(require, "user.configs.lsp")

	vim.api.nvim_command([[LspStart]]) -- Start LSPs
end
