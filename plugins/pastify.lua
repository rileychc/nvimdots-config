local custom = {}

custom["TobinPalmer/pastify.nvim"] = { --markdown image pasting
	lazy = true,
	cmd = { "Pastify" },
	config = function()
		require("pastify").setup({
			opts = {
				absolute_path = false, -- use absolute or relative path to the working directory
				apikey = "ea670f07ed9345145c483ccffe463b1c", -- Needed if you want to save online.
				local_path = "/assets/imgs/", -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
				save = "online", -- Either 'local' or 'online'
			},
			ft = { -- Custom snippets for different filetypes, will replace $IMG$ with the image url
				html = '<img src="$IMG$" alt="">',
				markdown = "![]($IMG$)",
				-- markdown = '<img  height=300 src="$IMG$" alt="">',
				tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
			},
		})
	end,
}

return custom
