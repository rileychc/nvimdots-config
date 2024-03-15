return function()
	local dap = require("dap")
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
			modulePaths = {},
			name = "LaunchYourClassName",
			request = "launch",
			type = "java",
		},
	}
end
