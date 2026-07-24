return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },
    {
    	"nvim-treesitter/nvim-treesitter",
    	opts = {
    		ensure_installed = {
    			"vim", "lua", "vimdoc",
                "html", "css", "javascript", "typescript", "tsx",
                "python", "go", "gomod", "gosum",
                "rust", "c", "cpp", "c_sharp",
                "elixir", "heex",
                "json", "yaml", "toml", "markdown", "markdown_inline",
                "bash", "dockerfile", "terraform",
                "sql", "gitignore"
    		},
    	},
    },

    -- harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end
    },

    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require('mason').setup({
                registries = {
                    'github:Crashdummyy/mason-registry', -- this contains the register for Roslyn
                    'github:mason-org/mason-registry',
                },
            })
        end
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {
            filewatching = "roslyn"
        }
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
    }
}
