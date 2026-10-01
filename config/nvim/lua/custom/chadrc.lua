---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
}

M.plugins = {
  user = {
    -- Mason for managing LSP/formatters
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSP config
    { "neovim/nvim-lspconfig" },

    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
      },
    },

    -- Treesitter (better syntax highlighting)
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
    {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim"
   },
},

},
}

return M
