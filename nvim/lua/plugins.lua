-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require("packer").use

require("packer").startup(
    function()
        use({"wbthomason/packer.nvim"})

        use({"lifepillar/vim-gruvbox8"})

        -- LSP
        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client

        -- Autocompletion
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
        use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
        use "L3MON4D3/LuaSnip" -- Snippets plugin

        -- Git commands
        use "tpope/vim-fugitive"

        -- Better git log display
        use({"rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = {"Flog"}})

        -- AutoFormater
        use({"sbdchd/neoformat", cmd = {"Neoformat"}})

        -- Better syntax highlighting
        use({"nvim-treesitter/nvim-treesitter", event = "BufEnter", run = ":TSUpdate"})

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
            {"lukas-reineke/indent-blankline.nvim", event = "VimEnter", config = [[require('config.indent-blankline')]]}
        )

        -- Automatic insertion and deletion of a pair of characters
        use({"Raimondi/delimitMate", event = "InsertEnter"})

        -- Comment plugin
        use({"tpope/vim-commentary", event = "VimEnter"})

        -- Markdown JSON header highlight plugin
        use({"elzr/vim-json", ft = {"json", "markdown"}})

        -- Syntax highlight for .toml files
        use({"cespare/vim-toml", ft = {"toml"}, branch = "main"})

        -- Nerd tree
        use "preservim/nerdtree"
        use({"tiagofumo/vim-nerdtree-syntax-highlight", after = "nerdtree"})
        use({"ryanoasis/vim-devicons", after = "nerdtree"})
    end
)

-------------------------------------------------------------------------------
--                 LSP SERVERS ANS AUTO COMPLETION                           --
-------------------------------------------------------------------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local nvim_lsp = require "lspconfig"
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {"clangd", "rust_analyzer", "pyright", "tsserver"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "luasnip"}
    }
}
