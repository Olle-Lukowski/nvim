return {
  {
    'echasnovski/mini.pick',
    config = true,
    keys = {
      {
        '<leader>pf',
        function() require('mini.pick').builtin.files() end,
        desc = 'Files',
      },
      {
        '<leader>pg',
        function() require('mini.pick').builtin.grep_live() end,
        desc = 'Files with live grep',
      },
      {
        '<leader>ph',
        function() require('mini.pick').builtin.help() end,
        desc = 'Help',
      },
      {
        '<leader>pb',
        function() require('mini.pick').builtin.buffers() end,
        desc = 'Buffers',
      },
    },
  },
}
