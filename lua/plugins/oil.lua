return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = (function()
      require "oil".setup {}
      
      vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open Oil" })
    end)
  }
}
