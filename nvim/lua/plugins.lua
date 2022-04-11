-- local fn = vim.fn
-- vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
-- local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

-- local plug_url_format = "https://github.com/%s"

-- local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
-- local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- -- Auto-install packer in case it hasn't been installed.
-- if fn.glob(packer_install_dir) == "" then
--     vim.api.nvim_echo({{"Installing packer.nvim", "Type"}}, true, {})
--     vim.cmd(install_cmd)
-- end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require("packer.util")

require("packer").startup(
    {
        function(use)
            -- Is using a standard Neovim install, i.e. built from source or using a
            -- provided appimage.
            use "lewis6991/impatient.nvim"

            use({"wbthomason/packer.nvim", opt = true})

            use({"lifepillar/vim-gruvbox8"})

            -- Autocompletion
            use {"hrsh7th/nvim-cmp", config = [[require('config.nvim-cmp')]]}

            -- nvim-cmp completion sources
            use {"hrsh7th/cmp-nvim-lsp"}
            use {"hrsh7th/cmp-nvim-lua"}
            use {"hrsh7th/cmp-path"}
            use {"hrsh7th/cmp-buffer"}

            --             -- Snippet engine and snippet template
            --             " For ultisnips users.
            use {"quangnguyen30192/cmp-nvim-ultisnips"}
            use({"SirVer/ultisnips"})
            use({"honza/vim-snippets", after = "ultisnips"})
            use "L3MON4D3/LuaSnip" -- Snippets plugin

            -- LSP
            use({"neovim/nvim-lspconfig", config = [[require('config.lsp')]]})

            -- Git commands
            use {"tpope/vim-fugitive", event = "VimEnter"}

            -- -- -- Better git log display
            -- -- use({"rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = {"Flog"}})

            -- AutoFormater
            use({"sbdchd/neoformat", cmd = {"Neoformat"}})

            -- Better syntax highlighting
            use({"nvim-treesitter/nvim-treesitter", event = "BufEnter", run = ":TSUpdate"})

            -- Super fast buffer jump
            use {
                "phaazon/hop.nvim",
                event = "VimEnter",
                config = function()
                    vim.defer_fn(
                        function()
                            require("config.nvim_hop")
                        end,
                        4000
                    )
                end
            }

            -- Plugin to manipulate character pairs quickly
            use({"machakann/vim-sandwich", event = "VimEnter"})

            -- Nice fuzzy finder
            use {
                "nvim-telescope/telescope.nvim",
                requires = {{"nvim-lua/plenary.nvim"}}
            }
            -- search emoji and other symbols
            use "nvim-telescope/telescope-symbols.nvim"

            -- Show git change (change, delete, add) signs in vim sign column
            use({"mhinz/vim-signify", event = "BufEnter"})

            -- colorful status line and theme
            use({"vim-airline/vim-airline-themes", after = "vim-signify"})
            use({"vim-airline/vim-airline", after = "vim-airline-themes"})

            -- fancy indentations
            use(
                {
                    "lukas-reineke/indent-blankline.nvim",
                    event = "VimEnter",
                    config = [[require('config.indent-blankline')]]
                }
            )

            -- -- Automatic insertion and deletion of a pair of characters
            -- use({"Raimondi/delimitMate", event = "InsertEnter"})

            -- Comment plugin
            use({"tpope/vim-commentary", event = "VimEnter"})

            -- Markdown JSON header highlight plugin
            use({"elzr/vim-json", ft = {"json", "markdown"}})

            -- Syntax highlight for .toml files
            use({"cespare/vim-toml", ft = {"toml"}, branch = "main"})

            -- -- Nerd tree
            -- use "preservim/nerdtree"
            -- use "tiagofumo/vim-nerdtree-syntax-highlight"
            -- use "ryanoasis/vim-devicons"

            -- To enable more of the features of rust-analyzer, such as inlay hints and more!
            use "simrat39/rust-tools.nvim"

            -- -- Mardown preview
            -- use(
            --     {
            --         "iamcco/markdown-preview.nvim",
            --         run = function()
            --             fn["mkdp#util#install"]()
            --         end,
            --         ft = {"markdown"}
            --     }
            -- )
        end
        -- config = {
        --     max_jobs = 16,
        --     compile_path = util.join_paths(vim.fn.stdpath("config"), "lua", "packer_compiled.lua"),
        --     git = {
        --         default_url_format = plug_url_format
        --     }
        -- }
    }
)
-- require("packer").startup(
--     {
--         function(use)

--             use {"kyazdani42/nvim-web-devicons", event = "VimEnter"}

--             use(
--                 {
--                     "lukas-reineke/indent-blankline.nvim",
--                     event = "VimEnter",
--                     config = [[require('config.indent-blankline')]]
--                 }
--             )

--             use "preservim/nerdtree"
--             use "tiagofumo/vim-nerdtree-syntax-highlight"
--             use "ryanoasis/vim-devicons"

--     }
-- )

-- local status, _ = pcall(require, "packer_compiled")
-- if not status then
--     vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
-- end
