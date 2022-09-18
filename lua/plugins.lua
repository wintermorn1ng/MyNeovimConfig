return require('packer').startup({
    function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use "nvim-lua/plenary.nvim"
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        }
        use 'kyazdani42/nvim-web-devicons'
        -- {添加插件}
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
        use {
            'lewis6991/gitsigns.nvim',
        }
        use {'numToStr/Comment.nvim'}
        use ({ 'projekt0n/github-nvim-theme' })
        use {'neoclide/coc.nvim', branch = 'release'}

    end,
    config = {
        max_jobs = 16,
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    }
})
