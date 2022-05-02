--some settings
vim.opt.termguicolors = true
vim.wo.number = true
vim.cmd[[let g:dashboard_default_executive ="telescope"]]
vim.cmd[[set mouse=a]]
vim.cmd[[autocmd bufenter * if (winnr("$") == 1 && exists("b:NvimTree") && b:NvimTree.isTabTree()) | q | endi]]

--local vim = vim
--local opt = vim.opt
--opt.foldmethod = "expr"
--opt.foldexpr = "nvim_treesitter#foldexpr()"
require"lspconfig".pyright.setup{}
require"lspconfig".cssls.setup{}
require"lspconfig".clangd.setup{}
--require"lspconfig".sumneko_lua.setup{}

--keymaps
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "


keymap("n","<leader>q",":q", { noremap = true  })
keymap("n","<leader>i",":PaqInstall", { noremap = true})
keymap("n","<leader>h",":sp", { noremap = true })
keymap("n","<leader>v",":vsp", { noremap = true })
keymap("n","<leader>op", ":NvimTreeToggle<cr>",  { noremap = true })
keymap("n","<leader>w", ";WhichKey<cr>", { noremap = true })

vim.cmd[[nnoremap <C-d> :Dashboard]]


--packages
require "paq" {
	  "savq/paq-nvim",
	
	--some shit
	  "nvim-telescope/telescope.nvim",
	  "nvim-neo-tree/neo-tree.nvim",
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
	  "akinsho/bufferline.nvim",
	  "glepnir/dashboard-nvim",
	  "rcarriga/nvim-notify",
	  "karb94/neoscroll.nvim",	

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
		}

		
--options
require("bufferline").setup{}vim.opt.termguicolors = true
require("bufferline").setup{}
require("neoscroll").setup()
require"nvim-tree".setup()
require("lualine").setup { options = { theme = "catppuccin"}}
require("bufferline").setup{}
require("neoscroll").setup()
require("nvim-lsp-installer").setup {}

require"nvim-treesitter.configs".setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = true,
  ignore_install = { "javascript" },

  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}


vim.cmd[[let g:dashboard_custom_header = [
    \"",
    \"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
    \"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    \"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
    \"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    \"          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    \"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    \"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    \" ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    \" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
    \"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    \"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    \"     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
    \"     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
    \"     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
    \"",
    \]
    ]]


vim.notify = require("notify")


--colorscheme
vim.api.nvim_command [[colorscheme catppuccin]]

--Available options: catppuccin, tokyonight, dracula, nord

--lualine
local lualine = require("lualine")
local colors = {
  bg       = "#1A1826",
  fg       = "#D9E0EE",
  yellow   = "#FAE3B0",
  cyan     = "#B5E8E0",
  darkblue = "#96CDFB",
  green    = "#ABE9B3",
  orange   = "#F8BD96",
  violet   = "#6E667E",
  magenta  = "#DDB6F2",
  blue     = "#89DCEB",
  red      = "#F28FAD",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}


-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don"t need space before this
}

ins_left {
  -- mode component
  function()
    return ""
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
}

ins_left {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
}

ins_left { "location" }

ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it"s any number greater then 2
ins_left {
  function()
    return "%="
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
}

-- Add components to right sections
ins_right {
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I"m not sure why it"s upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
}

ins_right {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn"t have them. sigh
  color = { fg = colors.green, gui = "bold" },
}

ins_right {
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
}

ins_right {
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}
lualine.setup(config)
vim.cmd[[set noshowmode]]

--nvim-cmp
  local cmp = require"cmp"

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        -- require("snippy").expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<leader>f"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),


    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" }, -- For vsnip users.
      -- { name = "luasnip" }, -- For luasnip users.
      -- { name = "ultisnips" }, -- For ultisnips users.
      -- { name = "snippy" }, -- For snippy users.
    }, {
      { name = "buffer" },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = "buffer" },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })

  -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" }
    }, {
      { name = "cmdline" }
    })
  })

  -- Setup lspconfig.
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you"ve enabled.
  require("lspconfig")["pyright, clangd, cssls"].setup {
    capabilities = capabilities
  }
