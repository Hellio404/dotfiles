local M = {}

-- In order to disable a default keymap, use
M.disabled = {
}

-- Your custom mappings
M.abc = {
  n = {
    ["<leader>q"] = {"<cmd>q!<CR>", "close current window"},
    ["<leader>w"] = {"<cmd>w!<CR>", "save current window"},
    ["<leader>c"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>e"] = { "<cmd>NvimTreeToggle <CR>", "focus nvimtree" },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    ["kj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },

  v = {
    ["<A-j>"] = {":m .+1<CR>==", "Move selected block down"},
    ["<A-k>"] = {":m .-2<CR>==", "Move selected block up"},
    ["<"] = {"<gv", "Indent left stay in virtual mode"},
    [">"] = {">gv", "Indent right stay in virtual mode"},
  },

  x = {
    ["J"] = {":move '>+1<CR>gv-gv", "Move block down"},
    ["K"] = {":move '<-2<CR>gv-gv", "Move block up"},
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
    ["<C-Up>"] = {":resize -2<CR>", "Resize window up"},
    ["<C-Down>"] = {":resize +2<CR>", "Resize window Down"},
    ["<C-Left>"] = {":vertical resize -2<CR>", "Resize window Left"},
    ["<C-Right>"] = {":vertical resize +2<CR>", "Resize window Right"},
  }
}

return M