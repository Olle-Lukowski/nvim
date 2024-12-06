return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufRead',
    keys = {
      {
        '<leader>ss',
        function() require('nvim-treesitter.incremental_selection').init_selection() end,
        desc = 'Start selecting',
      },
      {
        '<leader>sm',
        function() require('nvim-treesitter.incremental_selection').node_incremental() end,
        desc = 'Select incrementally',
        mode = 'v',
      },
      {
        '<leader>sM',
        function() require('nvim-treesitter.incremental_selection').scope_incremental() end,
        desc = 'Select the surrounding scope',
        mode = 'v',
      },
      {
        '<leader>sl',
        function() require('nvim-treesitter.incremental_selection').node_decremental() end,
        desc = 'Select decrementally',
        mode = 'v',
      },
    },
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
  },
}
