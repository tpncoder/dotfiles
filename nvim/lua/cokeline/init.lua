local get_hex = require('cokeline/utils').get_hex
require("cokeline").setup({
	default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', '161320')
         or get_hex('Comment', '161320')
    end,
    bg = get_hex('ColorColumn', '161320'),
  },

  components = {
    {
      text = ' ',
      bg = get_hex('Normal', '161320'),
    },
    {
      text = '',
      fg = get_hex('ColorColumn', '161320'),
      bg = get_hex('Normal', '161320'),
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
    {
      text = '',
      fg = get_hex('ColorColumn', '161320'),
      bg = get_hex('Normal', '161320'),
    },
  },})
