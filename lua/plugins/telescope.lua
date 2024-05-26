return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = (function()
      require "telescope".setup {}

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Fuzzy Find With Live Grep" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Fuzzy Find Buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Fuzzy Find Help" })
    end)
  }
}
