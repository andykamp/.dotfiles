-- Theme config for lualine

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ED7498',
  hotGreen   = '#03DAC5',
  violet = '#d183e8',
  grey   = '#303030',
  pinkBg = '#651C4A',
  pinkFg = '#AB307E',
  hotPink = '#F531B3',
  hotPurlple = '#BB86FC',
  hotYellow = '#FDFF9F',
  DiagnosticError =  '#d183e8',
  DiagnosticWarn =  '#d183e8',
  DiagnosticInfo =  '#d183e8',
  DiagnosticHint =  '#d183e8',
}

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.hotPink },
    b = { fg = colors.white, bg = colors.pinkBg },
    c = { fg = colors.white, bg = colors.pinkBg },
  },

  insert = { a = { fg = colors.black, bg = colors.hotGreen } },
  visual = { a = { fg = colors.black, bg = colors.hotYellow } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = theme,
        section_separators = '',
        component_separators = ''
  },
  sections = {
    lualine_a = {
      { 'mode' },
    },
    lualine_b = {
        {'diagnostics', always_visible = true,
        symbols = { error = 'E', warn = 'W', info = 'I', hint='H', },
        -- diagnostics_color = {
        --     -- Same values as the general color option can be used here.
        --     error = 'DiagnosticError', -- Changes diagnostics' error color.
        --     warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        --     info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        --     hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        --  },
        }
    },
    lualine_c = {
        {'filename', path=2 }
    },
    lualine_x = { 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {
        {'filename', path=2 }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'filetype', 'location' },
  },
  tabline = {},
  extensions = {},
}
