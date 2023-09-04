return {
    'numToStr/Comment.nvim',
    lazy=false,
    opts = {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
            line = '<leader>/',
            block = '<leader>*',
        },
        opleader = {
            line = '<leader>/',
            block = '<leader>*',
        },
        extra = {
            above = 'gcO',
            below = 'gco',
            eol = 'gcA',
        },
        mappings = {
            basic = true,
            extra = false,
        },
        pre_hook = nil,
        post_hook = nil,
    }
}
