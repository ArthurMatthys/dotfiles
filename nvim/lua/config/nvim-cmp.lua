-- Setup nvim-cmp.
local luasnip = require "luasnip"
local cmp = require "cmp"
-- local lspkind = require "lspkind"
cmp.setup {
    completion = {
        -- keyword_length = 1,
        completeopt = "menu,noselect,noinsert"
    },
    snippet = {
        expand = function(args)
            -- For `ultisnips` user.
            vim.fn["UltiSnips#Anon"](args.body)
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
                feedkeys(snippet_next_keys, "")
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
        {name = "nvim_lsp"}, -- For nvim-lsp
        -- {name = "ultisnips"}, -- For ultisnips user.
        {name = "nvim_lua"}, -- for nvim lua function
        {name = "path"}, -- for path completion
        {name = "buffer", keyword_length = 4} -- for buffer word completion
    }
}
-- cmp.setup(
--     {
--         formatting = {
--             format = lspkind.cmp_format(
--                 {
--                     with_text = false,
--                     menu = {
--                         nvim_lsp = "[LSP]",
--                         ultisnips = "[US]",
--                         nvim_lua = "[Lua]",
--                         path = "[Path]",
--                         buffer = "[Buffer]"
--                     }
--                 }
--             )
--         }
--     }
-- )
-- vim.cmd("hi link CmpItemMenu Comment")
