return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main/**.md"
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "epwalsh/pomo.nvim"
    },
    opts = {
      workspaces = {
        {
          name = "Main",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main",
        }
      }
    },
    config = true
  }
}
