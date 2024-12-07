return {
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      lsp_defaults.capabilities =
        vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP Actions',
        callback = function(event)
          local wk = require 'which-key'
          wk.add {
            { '<leader>g', group = 'Goto', buffer = event.buf },
            { '<leader>l', group = 'LSP', buffer = event.buf },
          }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover Doc', buffer = event.buf })
          vim.keymap.set(
            'n',
            '<leader>gd',
            vim.lsp.buf.definition,
            { desc = 'LSP Goto Definition', buffer = event.buf }
          )
          vim.keymap.set(
            'n',
            '<leader>gD',
            vim.lsp.buf.declaration,
            { desc = 'LSP Goto Declaration', buffer = event.buf }
          )
          vim.keymap.set(
            'n',
            '<leader>gi',
            vim.lsp.buf.implementation,
            { desc = 'LSP Goto Implementation', buffer = event.buf }
          )
          vim.keymap.set(
            'n',
            '<leader>go',
            vim.lsp.buf.type_definition,
            { desc = 'LSP Goto Type Definition', buffer = event.buf }
          )
          vim.keymap.set(
            'n',
            '<leader>gr',
            vim.lsp.buf.references,
            { desc = 'LSP Goto References', buffer = event.buf }
          )
          vim.keymap.set(
            'n',
            '<leader>ls',
            vim.lsp.buf.signature_help,
            { desc = 'LSP Signature Help', buffer = event.buf }
          )
          vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP Rename', buffer = event.buf })
          vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'LSP Action', buffer = event.buf })
          vim.keymap.set(
            { 'n', 'x' },
            '<leader>lf',
            function() vim.lsp.buf.format { async = true } end,
            { desc = 'LSP Format', buffer = event.buf }
          )
        end,
      })
    end,
  },
}
