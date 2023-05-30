local opts = {
	tools = {
		inlay_hints = {
			highlight = "SpecialKey",
		},
	},
	server = {
		filetypes = { "rust" },
		settings = {
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
					allTargets = false,
				},
			},
		},
	}
}
return opts
