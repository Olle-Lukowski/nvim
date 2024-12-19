return {
  {
    'rebelot/heirline.nvim',
    dependencies = {
      'Zeioth/heirline-components.nvim',
    },
    event = 'UiEnter',
    config = function()
      local heirline = require 'heirline'
      local lib = require 'heirline-components.all'

      lib.init.subscribe_to_events()
      heirline.load_colors(lib.hl.get_colors())
      heirline.setup {
        tabline = {
          lib.component.tabline_conditional_padding(),
          lib.component.tabline_buffers(),
          lib.component.fill { hl = { bg = 'tabline_bg' } },
          lib.component.tabline_tabpages(),
        },
        statusline = {
          hl = { fg = 'fg', bg = 'bg' },
          lib.component.mode(),
          lib.component.git_branch(),
          lib.component.file_info(),
          lib.component.git_diff(),
          lib.component.diagnostics(),
          lib.component.fill(),
          lib.component.cmd_info(),
          lib.component.fill(),
          lib.component.lsp(),
          lib.component.compiler_state(),
          lib.component.nav(),
          lib.component.mode { surround = { seperator = 'right' } },
        },
      }
    end,
  },
}
