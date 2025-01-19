-- =========================
-- Mason Setup
-- =========================
require("mason").setup()
require("mason-lspconfig").setup({
    -- Ensure these servers are always installed
    ensure_installed = {
        "bashls",      -- Bash
        "clangd",      -- C/C++
        "cssls",       -- CSS
        "dockerls",    -- Docker
        "html",        -- HTML
        "jdtls",       -- Java
        "ts_ls",       -- JavaScript / TypeScript
        "jsonls",      -- JSON
        "texlab",      -- LaTeX
        "lua_ls",      -- Lua
        "marksman",    -- Markdown
        "pyright",     -- Python
        "sqlls",       -- SQL
        "terraformls", -- Terraform
        "yamlls",      -- YAML
    }
})

-- =========================
-- LSP Configuration
-- =========================
local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- This will auto-setup all Mason-installed servers
-- with default settings. You can override per server.
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,

      -- This function runs for each LSP client attached to a buffer
      on_attach = function(client, bufnr)
        -- Example keybindings for LSP usage
        local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        -- ... etc
      end
    })
  end
})

