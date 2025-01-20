-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "rose-pine/nvim", as = "rose-pine" }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- LSP Support
    use 'neovim/nvim-lspconfig'            -- Collection of configurations for built-in LSP
    use 'williamboman/mason.nvim'          -- Package manager for LSP servers, DAP servers, linters, and formatters
    use 'williamboman/mason-lspconfig.nvim'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'                 -- The main completion plugin
    use 'hrsh7th/cmp-nvim-lsp'             -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'               -- Buffer completions
    use 'hrsh7th/cmp-path'                 -- Path completions

    -- Snippets (required by nvim-cmp for expanding snippet completions)
    use 'L3MON4D3/LuaSnip'                 -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'         -- LuaSnip completions source

    -- For formatting, linting, etc.
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jay-babu/mason-null-ls.nvim'
end)
