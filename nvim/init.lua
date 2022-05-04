require('nvimtree')
require('bufferline')
require('telescope')
require('nvim-cmp')
require('keymaps')
require('treesitter')
require('lsp')

--some settings
vim.opt.termguicolors = true
vim.wo.number = true
vim.cmd[[let g:dashboard_default_executive ="telescope"]]
vim.cmd[[set mouse=a]]
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
vim.cmd[[autocmd FileType Alpha set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2]]
vim.cmd[[:set cursorline]]


local vim = vim
local opt = vim.opt
--opt.foldmethod = "indent"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd[[setlocal foldignore=]]

require"lspconfig".pyright.setup{}
require"lspconfig".cssls.setup{}
require"lspconfig".clangd.setup{}
require"lspconfig".omnisharp.setup{}
--require"lspconfig".sumneko_lua.setup{}


	--packages
require "paq" {
	  	"savq/paq-nvim",
	
		--some shit
	  	"nvim-telescope/telescope.nvim",
	  	--"nvim-neo-tree/neo-tree.nvim",
	  	"nvim-treesitter/nvim-treesitter",
	 	"kyazdani42/nvim-tree.lua",
	 	"kyazdani42/nvim-web-devicons",
	  	"nvim-lua/plenary.nvim",
	  	"folke/which-key.nvim",
	
		--colorschemes
	  	"catppuccin/nvim",
	  	"arcticicestudio/nord-vim",
 	  	"dracula/vim",
	  	"folke/tokyonight.nvim",
		'navarasu/onedark.nvim',
		"ellisonleao/gruvbox.nvim",
		'NTBBloodbath/doom-one.nvim',
		'tomasiser/vim-code-dark',

		--completion and lsp
	  	"hrsh7th/vim-vsnip",
	  	"hrsh7th/vim-vsnip",
	  	"hrsh7th/vim-vsnip-integ",
	  	"neovim/nvim-lspconfig",
	  	"hrsh7th/cmp-nvim-lsp",
	  	"hrsh7th/cmp-buffer",
	  	"hrsh7th/cmp-path",
	  	"hrsh7th/cmp-cmdline",	 
	  	"hrsh7th/nvim-cmp",
	  	"L3MON4D3/LuaSnip",
	  	"saadparwaiz1/cmp_luasnip",
	  	"williamboman/nvim-lsp-installer",

		--icing of the cake
	 	"rcarriga/nvim-notify",
		"nvim-lualine/lualine.nvim",
	  	'folke/which-key.nvim', 
	 	'kdheepak/tabline.nvim',
		--"glepnir/dashboard-nvim",
	  	"karb94/neoscroll.nvim",
		--'feline-nvim/feline.nvim',
	  	--'itchyny/lightline.vim',
	  	'goolord/alpha-nvim',
	  	"akinsho/toggleterm.nvim",

	  	"lervag/vimtex",
	  	"mattn/efm-langserver",
	  	"pangloss/vim-javascript",
	  	"MaxMEllon/vim-jsx-pretty",
	  	"airblade/vim-gitgutter",
	  	"tpope/vim-unimpaired",
	  	"tpope/vim-surround",	
		"mhartington/formatter.nvim",
  	  	"alvan/vim-closetag",
	  	"jiangmiao/auto-pairs",
		'Pocco81/TrueZen.nvim',
			}

--options
require("neoscroll").setup()
require"nvim-tree".setup()
require("nvim-lsp-installer").setup {}
require("which-key").setup {}


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



require('alpha').setup(require'alpha.themes.dashboard'.config)
local present, alpha = pcall(require, "alpha")

if not present then
   return
end

local function button(sc, txt, keybind)
   local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

   local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "AlphaButtons",
   }

   if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
   end

   return {
      type = "button",
      val = txt,
      on_press = function()
         local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
         vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
   }
end

local options = {}

local ascii = {
   "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
   "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
   "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
   "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
   "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
   "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
   "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
   " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
   " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
   "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
   "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

options.header = {
   type = "text",
   val = ascii,
   opts = {
      position = "center",
      hl = "AlphaHeader",
   },
}

options.buttons = {
   type = "group",
   val = {
      button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
      button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
      button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
      button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
      button("SPC t h", "  Themes  ", ":Telescope colorscheme<CR>"),
      button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
   },
   opts = {
      spacing = 1,
   },
}

alpha.setup {
   layout = {
      { type = "padding", val = 9 },
      options.header,
      { type = "padding", val = 2 },
      options.buttons,
   },
   opts = {},
}

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



