-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Setup mason for managing external tools
    require("mason").setup()

    -- Automatically install LSP servers
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ruff_lsp",
        "eslint",
        "tailwindcss",
        "emmet_language_server",
        "jsonls",
        "ts_ls", -- Use the correct server name here
      },
    })

    -- Setup LSP servers
    local lspconfig = require("lspconfig")

    -- Setup handlers for LSP servers
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        -- Setup each LSP server
        lspconfig[server_name].setup({
          on_attach = function(_, bufnr)
            -- Define key mappings for LSP functions
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            -- Key mappings
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)        -- Go to definition
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)              -- Hover documentation
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)    -- Go to implementation
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)     -- Rename symbol
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Code action
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)         -- Find references
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)      -- Format document
            vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, bufopts) -- Document symbols
          end,
        })
      end,
    })
  end,
}

