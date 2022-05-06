
local function main()
  return [[ ]]
end

-- stylua: ignore
local colors = {
  blue   = '#96CDFB',
  cyan   = '#79dac8',
  black  = '#302D41',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#96CDFB',
  grey   = '#272536',
}

local cat = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = cat,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { main, separator = { right = '' }, right_padding = 2 },
    },
    --lualine_b = {{'filename', separator = { right = '' } }},
    lualine_b = {{ 'filename', path = 1, separator = { right = '' }, left_padding = 3 }},
    lualine_y = {'mode'},
    lualine_z = {
      {'progress',separator = { left = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}


