require('gitsigns').setup {
    signs = {
        add = { hl = 'GitGutterAdd', text = '+' },
        change = { hl = 'GitGutterChange', text = '~' },
        delete = { hl = 'GitGutterDelete', text = '_' },
        topdelete = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' },
    },
    -- uncommment to use more modern signs
    -- signs = {
    --   add = { text = "▎" },
    --   change = { text = "▎" },
    --   delete = { text = "▎" },
    --   topdelete = { text = "契" },
    --   changedelete = { text = "▎" },
    -- },
}

