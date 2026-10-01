local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- TypeScript / JavaScript
lspconfig.tsserver.setup {
  capabilities = capabilities,
}

-- ESLint
lspconfig.eslint.setup {
  capabilities = capabilities,
}
