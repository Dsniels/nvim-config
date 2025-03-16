return {
  -- Plugin for nvim-cmp LSP support
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  -- LuaSnip and its dependencies
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",     -- For LuaSnip integration
      "rafamadriz/friendly-snippets", -- Friendly snippets for LuaSnip
    },
  },
  -- nvim-cmp setup for autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Lazy load VSCode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Setup nvim-cmp
      cmp.setup({
        snippet = {
          -- Expand snippets using LuaSnip
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),   -- Scroll up in documentation
          ["<C-f>"] = cmp.mapping.scroll_docs(4),    -- Scroll down in documentation
          ["<C-Space>"] = cmp.mapping.complete(),    -- Trigger completion
          ["<C-e>"] = cmp.mapping.abort(),           -- Abort completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },   -- LSP completions
          { name = "luasnip" },    -- LuaSnip completions
        }, {
          { name = "buffer" },     -- Buffer completions
        }),
      })
    end,
  },
}


