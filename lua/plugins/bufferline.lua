return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  lazy = true,
  priority = 1050,
  event = "VeryLazy",
  keys = {
    { "<leader>0", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader><C-0>", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>[", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<leader>]", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = function(_, opts)
    return {
      options = {
        -- stylua: ignore
        close_command = function(n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = "⟡ " }),
          },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
          {
            filetype = "snacks_layout_box",
          },
        },
        separator_style = { "<==", "==>" },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        numbers = function(opts)
          return string.format("%s◈ %s", opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        ---@param opts bufferline.IconFetcherOpts
        get_element_icon = function(opts)
          return LazyVim.config.icons.ft[opts.filetype]
        end,
        highlight = require("catppuccin.special.bufferline").get_theme({
          custom = {
            all = {
              background = {
                fg = "#f0f0f0",
                bg = "#f0f0f0",
              },

              buffer_selected = {
                fg = "#f0f0f0",
                bg = "#f0f0f0",
                bold = true,
                italic = true,
              },

              numbers = {
                fg = "#f0f0f0",
                bg = "#f0f0f0",
              },
              numbers_visible = {
                fg = "#f0f0f0",
                bg = "#f0f0f0",
              },
              numbers_selected = {
                fg = "#f0f0f0",
                bg = "#f0f0f0",
                bold = true,
                italic = true,
              },
            },
          },
        }),
      },
    }
  end,
  config = function(_, opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
    require("bufferline").setup({
      highlights = require("catppuccin.special.bufferline").get_theme(),
    })
  end,
}
