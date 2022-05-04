	--lualine
require('lualine').setup {
	options = {
    		icons_enabled = true,
    		theme = 'auto',
    		component_separators = { left = '', right = '|'},
    		section_separators = { left = '', right = ''},
    		disabled_filetypes = {},
    		always_divide_middle = true,
    		globalstatus = false,
  	},
  	sections = {
    		lualine_a = {},
    		lualine_b = {{ 'mode', separator = { left = '', right = '' }, right_padding = 2 },},
    		lualine_c = {'filename'},
    		lualine_x = {''},
    		lualine_y = {'filetype', 'progress'},
    		lualine_z = {{ 'location', separator = { right = '' }, left_padding = 2 },},},
  	inactive_sections = {
    		lualine_a = {},
    		lualine_b = {},
    		lualine_c = {▊},
    		lualine_x = {},
    		lualine_y = {},
    		lualine_z = {}
 	},
  		tabline = {},
 		extensions = {}
		}

