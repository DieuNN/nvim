return {
   {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  {
    "windwp/nvim-ts-autotag",
    opts = {
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = false -- Auto close on trailing </
    },
  },

  -- Neogit - Magit-like Git interface for Neovim
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,  -- Enable diffview for side-by-side diffs
        },
        commit_editor = {
          kind = "vsplit",
          show_staged_diff = true,
          staged_diff_split_kind = "vsplit",  -- Side-by-side view
        },
        commit_view = {
          kind = "vsplit",
        },
      })
    end,
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
  },
}
