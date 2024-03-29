local present, bufferline = pcall(require, "bufferline")

if not present then
   return
end

local options = {
   	options = {
		hover = {
		enabled = true,
		delay = 200,
		reveal = {'close'}
	}, 
    offsets = { { filetype = "neo-tree", text = "", padding = 0 } },
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    show_close_icon = false,
    left_trunc_marker = " ",
    right_trunc_marker = " ",
    max_name_length = 20,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    show_buffer_close_icons = true,
      themable = true,
	  indicator = {
			  icon = '',
			  style='icon'
	  },

      -- top right buttons in bufferline
      custom_areas = {
         right = function()
            return {
            }
         end,
      },
   },
}

bufferline.setup(options)

