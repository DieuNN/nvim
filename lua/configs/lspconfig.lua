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
local function get_vue_language_server_path()
  local handle = io.popen("npm root -g")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "") .. "/@vue/language-server"
  end
  return nil
end

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = get_vue_language_server_path(),
        languages = { "vue" },
      },
    },
    tsserver = {
      path = vim.fn.getcwd() .. "/node_modules/typescript/lib",
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

-- Configure clangd for C/C++ development
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  settings = {
    clangd = {
      inlayHints = {
        designatedStrings = true,
        parameterNames = true,
        blockEnd = true,
      },
    },
  },
})

-- Enable language servers
local servers = { "html", "cssls", "vue_ls", "ts_ls", "clangd", "tailwindcss" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
