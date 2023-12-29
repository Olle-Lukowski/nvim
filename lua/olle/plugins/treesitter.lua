return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = (function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c", "lua", "rust", 'cpp', 'wgsl', 'elixir', 'zig', 'python' },
      sync_install = false,
      auto_install = true,
      highlight = {
	enable = true,
      },
    })
  end),
}
