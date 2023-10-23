require("ibl").setup {
    indent = { char = '┊' },
    whitespace =  {
       remove_blankline_trail = false,
    },
    exclude= {
        filetypes = { "help", "packer" },
        buftypes = { "terminal", 'nofile' },
    },
}

