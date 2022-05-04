--colorscheme
vim.api.nvim_command [[colorscheme catppuccin]]
vim.cmd[[set noshowmode]]
vim.opt.background = "dark"

local catppuccin = require("catppuccin")
catppuccin.setup{
	transparent_background = true,
term_colors = false,
styles = {
	comments = "italic",
	functions = "italic",
	keywords = "italic",
	strings = "NONE",
	variables = "italic",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = true,
		transparent_panel = false,
	},
	neotree = {
		enabled = true,
		show_root = true,
		transparent_panel = true,
	},
	which_key = false,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
	dashboard = true,
	neogit = true,
	vim_sneak = true,
	fern = true,
	barbar = true,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = false,
	hop = true,
	notify = true,
	telekasten = true,
	symbols_outline = true,
	}
}
--Available options: catppuccin, tokyonight, dracula, nord, gruvbox, onedark, doom-one, codedark

