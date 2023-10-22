local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local custom_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
}

-----------------------------------------------------------------------------
-- lualine
-----------------------------------------------------------------------------
require('lualine').setup {
    options = {
        -- theme = custom_theme, // uncomment this line to use custom theme
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'diff', 'diagnostic' },
        lualine_y = {},
        lualine_z = {},


        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_b = { { 'filename', path = 1 } },
        -- lualine_x = { 'filetype' },
        -- lualine_y = { 'progress' },
        -- lualine_z = { 'location' }
    },
    -- sections = {
    --     lualine_a = { 'mode', {'branch'},{'filename', path=2},  },
    --     lualine_b = {},
    --     lualine_c = {{'diagnostics', always_visible = true, symbols = { error = 'E', warn = 'W', info = 'I', hint='H', } } },
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {},
    -- }
}

