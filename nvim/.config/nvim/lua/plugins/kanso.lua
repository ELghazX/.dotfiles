return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    -- you can do it like this with a config function
    config = function()
      require("kanso").setup({
        transparent = true,
        -- configurations
      })
    end,
    -- or just use opts table
    opts = {
      -- configurations
    },
  },
}
