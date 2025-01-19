require("mason-null-ls").setup({
  ensure_installed = {
    "black", -- Ensure Black is installed via Mason
  },
  automatic_installation = true, -- Automatically install configured formatters
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Python formatting via Black
    null_ls.builtins.formatting.black,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Create the :Format command
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, { desc = "Format the current buffer with LSP" })

      -- Optional: Auto-format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

