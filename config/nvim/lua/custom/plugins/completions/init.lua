return {
  {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',

    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/nvim-cmp',
    },

    config = function()
      local loader = require('luasnip.loaders.from_vscode')
      local snip = require('luasnip')

      loader.lazy_load()
      loader.lazy_load({ paths = '~/.config/nvim/custom-snippets/' })

      -- nvim-cmp setup
      local cmp = require('cmp')
      local types = require('cmp.types')

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif snip.locally_jumpable(1) then
              snip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif snip.locally_jumpable(-1) then
              snip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'luasnip' },
        }),
        {
          { name = "buffer" },
        },
      })
    end,
  },
}
