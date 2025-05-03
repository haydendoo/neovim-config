require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "pyright",
  "gopls",
  "elixirls",
  "omnisharp",
  "clangd",
  "ts_ls",
  "terraformls",
  "dockerls",
  "docker_compose_language_service"
}

vim.lsp.enable(servers)
