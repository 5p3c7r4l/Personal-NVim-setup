return {
    {
        "mason-org/mason.nvim",
        config = function()
            require('mason').setup({})
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = {
                    'luau_lsp',
                    'clangd',
                    'quick_lint_js',
                    'jsonls',
                    'pyright',
                    'lua_ls',
                    'glint'
                },
            })
        end,
    },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            completion = { 
                menu = {
                    draw = {
                        treesitter = {'lsp'},
                        components = {
                            kind_icon = {
                                ellipsis = true,
                            },
                        },
                    },
                    enabled = true,
                    min_width = 30,
                    max_height = 20,
                    border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+
                    winblend = 0,
                    winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                    -- Keep the cursor X lines away from the top/bottom of the window
                    scrolloff = 2,
                    -- Note that the gutter will be disabled when border ~= 'none'
                    scrollbar = true,
                    -- Which directions to show the window,
                    -- falling back to the next direction when there's not enough space
                    direction_priority = { 's', 'n' },

                    -- Whether to automatically show the window when new completion items are available
                    auto_show = true,
                },
                documentation = { 
                    auto_show = false,
                    treesitter_highlighting = true,
                },
                ghost_text = {
                    enabled = true
                },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },

        },
        opts_extend = { "sources.default" },


    },

    {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  -- example using `opts` for defining servers
  opts = {
    servers = {
      lua_ls = {}
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end

 -- example calling setup directly for each LSP
}
}
