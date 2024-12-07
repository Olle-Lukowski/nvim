return {
  {
    'echasnovski/mini.files',
    init = function()
      local mini_open_folder = function(path) require('mini.files').open(path) end
      require('utils').autocmd.attach_file_browser('mini.files', mini_open_folder)
    end,
    keys = {
      {
        '-',
        function() require('mini.files').open() end,
        desc = 'Open file system (mini.files)',
      },
    },
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
}
