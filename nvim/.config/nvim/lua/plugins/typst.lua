return {
  -- Plugin untuk syntax highlighting
  {
    "kaarmu/typst.vim",
    ft = "typst",
  },

  -- Konfigurasi LSP manual untuk typst-lsp
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       typst_lsp = {
  --         default_config = {
  --           cmd = { "typst-lsp" },
  --           filetypes = { "typst" },
  --           root_dir = function(fname)
  --             return require("lspconfig.util").root_pattern(".git")(fname) or vim.fn.getcwd()
  --           end,
  --           single_file_support = true,
  --         },
  --       },
  --     },
  --   },
  -- },
}
