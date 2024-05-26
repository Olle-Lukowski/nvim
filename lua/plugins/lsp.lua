local lsps = { "zls", "clangd", "rust_analyzer", "lua_ls", "cmake" }
local mason_lsps = { "zls", "lua_ls", "cmake" }

return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    event = "LspAttach",
    config = (function()
      require "lspsaga".setup {}

      vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { desc = "LSP Hover" })
      vim.keymap.set("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", { desc = "LSP Code Action" })
      vim.keymap.set("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", { desc = "LSP Rename" })
      vim.keymap.set("n", "<leader>pd", "<CMD>Lspsaga peek_definition<CR>", { desc = "LSP Peek Definition" })
      vim.keymap.set("n", "<leader>gd", "<CMD>Lspsaga goto_definition<CR>", { desc = "LSP Goto Definition" })
    end)
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    config = (function()
      require "mason".setup {}

      require "mason-lspconfig".setup {
        ensure_installed = mason_lsps
      }

      local capabilities = require "cmp_nvim_lsp".default_capabilities()

      local lspconfig = require "lspconfig"
      for _, lsp in ipairs(lsps) do
        lspconfig[lsp].setup {
          capabilities = capabilities
        }
      end
    end)
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { 
      "hrsh7th/cmp-nvim-lsp", 
      "hrsh7th/cmp-buffer", 
      "hrsh7th/cmp-path", 
      "hrsh7th/cmp-cmdline", 
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip"
    },
    config = (function()
      local cmp = require "cmp"

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline" },
        }
      }

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end)
  }
}
