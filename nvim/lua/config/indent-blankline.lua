vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#01d2021 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1f2424 gui=nocombine]]

require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2"
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2"
    },
    show_trailing_blankline_indent = false
}
