require("nvim-lsp-installer").setup({
   ensure_installed = { "rust_analyzer", "sumneko_lua", "html", "cssls", "pyright", "clangd" }, -- ensure these servers are always installed
   automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
   	ui = {
        icons = {
            server_installed = "✓",
            pending = "➜",
            server_uninstalled = "✗"
        }
    }
})



require"lspconfig".pyright.setup{}
require"lspconfig".cssls.setup{}
require"lspconfig".clangd.setup{}
require"lspconfig".omnisharp.setup{}
require"lspconfig".html.setup{}
require"lspconfig".sumneko_lua.setup{}
