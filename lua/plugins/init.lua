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

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "javascript", "typescript", "tsx", "vue"
  		},
  	},
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
      })
    end,
  },

  -- Comment.nvim - Smart and powerful commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    lazy = false,
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

  -- Flutter Tools - Flutter development with LSP support
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        fvm = true,  -- Enable FVM support
        lsp = {
          settings = {
            showtodos = true,
            completefunctioncalls = true,
            renamefileswithclasses = "always",
            updateimportsonrename = true,
          },
        },
      })
    end,
    ft = "dart",
  },

  -- Blame.nvim - Git blame annotations
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end,
    cmd = { "BlameToggle" },
  },

  -- Render Markdown - Beautiful markdown rendering in Neovim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    ft = "markdown",
    cmd = { "RenderMarkdown" },
  },

  -- GitLab.nvim - GitLab integration for merge requests and code review
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
    },
    enabled = true,
    build = function()
      require("gitlab.server").build(true)
    end,
    config = function()
      require("gitlab").setup({
        statusline = {
          enabled = true  -- Show GitLab Duo Code Suggestions status
        },
      })
    end,
    keys = {
      { "<leader>glr", "<cmd>lua require('gitlab').review()<cr>", desc = "GitLab review" },
      { "<leader>gls", "<cmd>lua require('gitlab').summary()<cr>", desc = "GitLab summary" },
      { "<leader>glA", "<cmd>lua require('gitlab').approve()<cr>", desc = "GitLab approve MR" },
      { "<leader>glR", "<cmd>lua require('gitlab').revoke()<cr>", desc = "GitLab revoke approval" },
      { "<leader>glc", "<cmd>lua require('gitlab').create_comment()<cr>", desc = "GitLab create comment" },
      { "<leader>glC", "<cmd>lua require('gitlab').create_multiline_comment()<cr>", desc = "GitLab multiline comment", mode = "v" },
      { "<leader>glO", "<cmd>lua require('gitlab').create_comment_suggestion()<cr>", desc = "GitLab comment suggestion", mode = "v" },
      { "<leader>glm", "<cmd>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<cr>", desc = "GitLab move to discussion" },
      { "<leader>gln", "<cmd>lua require('gitlab').create_note()<cr>", desc = "GitLab create note" },
      { "<leader>gld", "<cmd>lua require('gitlab').toggle_discussions()<cr>", desc = "GitLab toggle discussions" },
      { "<leader>glaa", "<cmd>lua require('gitlab').add_assignee()<cr>", desc = "GitLab add assignee" },
      { "<leader>glad", "<cmd>lua require('gitlab').delete_assignee()<cr>", desc = "GitLab delete assignee" },
      { "<leader>glra", "<cmd>lua require('gitlab').add_reviewer()<cr>", desc = "GitLab add reviewer" },
      { "<leader>glrd", "<cmd>lua require('gitlab').delete_reviewer()<cr>", desc = "GitLab delete reviewer" },
      { "<leader>glp", "<cmd>lua require('gitlab').pipeline()<cr>", desc = "GitLab pipeline" },
      { "<leader>glo", "<cmd>lua require('gitlab').open_in_browser()<cr>", desc = "GitLab open in browser" },
      { "<leader>glM", "<cmd>lua require('gitlab').merge()<cr>", desc = "GitLab merge MR" },
      { "<leader>glu", "<cmd>lua require('gitlab').copy_mr_url()<cr>", desc = "GitLab copy MR URL" },
      { "<leader>glP", "<cmd>lua require('gitlab').publish_all_drafts()<cr>", desc = "GitLab publish drafts" },
      { "<leader>glD", "<cmd>lua require('gitlab').toggle_all_discussions()<cr>", desc = "GitLab toggle all discussions" },
    },
  },
}
