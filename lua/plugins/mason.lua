return {
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      handlers = {
        function(server_name) require('lspconfig')[server_name].setup {} end,
      },
    },
  },
  {
    'williamboman/mason.nvim',
    lazy = true,
    opts = {},
  },
}
