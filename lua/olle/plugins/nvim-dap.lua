return {{
  'jay-babu/mason-nvim-dap.nvim',
  dependencies = {
    'mfussenegger/nvim-dap',
    'williamboman/mason.nvim',
  },
  opts = {
    handlers = {},
  },
  event = 'VeryLazy',
},
{
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  event = 'VeryLazy',
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- mappings
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
    vim.keymap.set('n', '<leader>dc', dap.continue)
  end
}
}
