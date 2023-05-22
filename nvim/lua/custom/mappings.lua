local M = {}

-- In order to disable a default keymap, use
M.disabled = {
}

-- Your custom mappings
M.abc = {
	n = {
		["d"] = { '"_d', "Delete instead of cut" },
		["<leader>q"] = { "<cmd>q!<CR>", "close current window" },
		["<leader>w"] = { "<cmd>w!<CR>", "save current window" },
		["<leader>e"] = { "<cmd>NvimTreeToggle <CR>", "focus nvimtree" },
	},

	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},

	v = {
		["<A-j>"] = { ":m .+1<CR>==", "Move selected block down" },
		["<A-k>"] = { ":m .-2<CR>==", "Move selected block up" },
		["<"] = { "<gv", "Indent left stay in virtual mode" },
		[">"] = { ">gv", "Indent right stay in virtual mode" },
	},

	x = {
		["J"] = { ":move '>+1<CR>gv-gv", "Move block down" },
		["K"] = { ":move '<-2<CR>gv-gv", "Move block up" },
	},
}

M.general = {
	n = {
		["<S-l>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},
		["<S-h>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},
		["<leader>tt"] = {
			function()
				require("base46").toggle_theme()
			end,
			"toggle theme",
		},
		["<C-Up>"] = { ":resize -2<CR>", "Resize window up" },
		["<C-Down>"] = { ":resize +2<CR>", "Resize window Down" },
		["<C-Left>"] = { ":vertical resize -2<CR>", "Resize window Left" },
		["<C-Right>"] = { ":vertical resize +2<CR>", "Resize window Right" },
		["<Up>"] = { "<Nop>", "Disable arrow up in normal mode" },
		["<Down>"] = { "<Nop>", "Disable arrow down in normal mode" },
		["<Left>"] = { "<Nop>", "Disable arrow left in normal mode" },
		["<Right>"] = { "<Nop>", "Disable arrow right in normal mode" },
		["<leader>fl"] = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it rain" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- git
		["<leader>br"] = { "<cmd> Telescope git_branches <CR>", "git branches" },
		["<leader>ss"] = { "<cmd> Telescope git_stash <CR>", "git stash" },
		["<leader>gi"] = {
			function()
				require('telescope.builtin').lsp_implementations()
			end,
			"lsp implementations"
		},
		["<leader>rf"] = {
			function()
				require('telescope.builtin').lsp_references()
			end,
			"lsp references"
		},
		["<leader>ld"] = {
			function()
				require('telescope.builtin').diagnostics()
			end,
			"lsp references"
		},
	},
}

return M
