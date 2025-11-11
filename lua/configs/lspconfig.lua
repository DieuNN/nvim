require("nvchad.configs.lspconfig").defaults()

-- Enable inlay hints when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Configure TypeScript with Vue plugin support
vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand("$HOME/.nvm/versions/node/v22.13.0/lib/node_modules/@vue/language-server"),
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

-- Configure Vue language server with inlay hints
vim.lsp.config("vue_ls", {
  settings = {
    vue = {
      inlayHints = {
        destructuredProps = { enabled = true },
        inlineHandlerLoading = { enabled = true },
        missingProps = { enabled = true },
        optionsWrapper = { enabled = true },
        vBindShorthand = { enabled = true },
      },
    },
  },
})

-- Enable language servers
local servers = { "html", "cssls", "vue_ls", "ts_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
