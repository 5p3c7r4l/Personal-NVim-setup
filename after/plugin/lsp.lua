local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		'ccls',
		'clangd',
		'quick_lint_js',
		'jsonls',
		'sourcery',
		'pyright',
		'lua_ls'},
		handlers = {
			function(server_name)
				require('lspconfig')[server_name].setup({})
			end,
		}
	})


--Autocomplete
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<C-v>'] = cmp.mapping.confirm({select = false}),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<C-b>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-f>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-Space>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
