vim.g.mapleader = " "
vim.cmd [[set mouse=a]]

--Keybindings
vim.wo.number = true
vim.api.nvim_set_keymap(
  "n",
  "<leader>q",
  ":q<cr>",
  { noremap = true }
 )

vim.api.nvim_set_keymap(
  "n",
  "<leader>i",
  ":PackerInstall<cr>",
  { noremap = true }
 )

vim.cmd[[nnoremap <silent> <c-p> :lua require("nvim-find.defaults").files()<cr>]]
vim.cmd[[nnoremap <silent> <leader>b :lua require("nvim-find.defaults").buffers()<cr>]]
 vim.api.nvim_set_keymap(
   "n",
   "<leader>f",
   ":Neotree<cr>",
   { noremap = true }
 )

 vim.api.nvim_set_keymap(
 	"n",
	"<leader>h",
	":sp<cr>",
	{ noremap = true }
 )

 vim.api.nvim_set_keymap(
 	"n",
	"<leader>v",
	":vsp<cr>",
	{ noremap = true }
 )

require("bufferline").setup{}vim.opt.termguicolors = true
require("bufferline").setup{}
require('neoscroll').setup()
 --Packages
require("packer").startup(
  function()
    use { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    }
  }
    use "preservim/nerdcommenter"
    use "wbthomason/packer.nvim"
    use "morhetz/gruvbox"
    use({
	"catppuccin/nvim",
	as = "catppuccin"
})
	use'nvim-treesitter/nvim-treesitter'
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
end
}
use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' }
}
use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
    use "pangloss/vim-javascript"
    use "MaxMEllon/vim-jsx-pretty"

    use "jiangmiao/auto-pairs"
    use "glepnir/dashboard-nvim"
    use "liuchengxu/vim-clap"
    use "vijaymarupudi/nvim-fzf"
    use "alvan/vim-closetag"
    use "tpope/vim-unimpaired"
    use "tpope/vim-surround"
    use "mhartington/formatter.nvim"
    use "tpope/vim-fugitive"
    use "airblade/vim-gitgutter"
    use "hrsh7th/nvim-compe"
    use "mattn/efm-langserver"
    use 'karb94/neoscroll.nvim'
	use "rcarriga/nvim-notify"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
   use { 'kyazdani42/nvim-web-devicons' } 
    use "junegunn/vim-peekaboo"
    use 'natecraddock/nvim-find'
    use "junegunn/goyo.vim"
    use "junegunn/limelight.vim"
    use "tpope/vim-obsession"
    use "haya14busa/is.vim"
    use {'neoclide/coc.nvim', branch = 'release'}
    use "nelstrom/vim-visual-star-search"
    use {
     'ms-jpq/coq_nvim',
     branch = 'coq',
     event = "VimEnter",
     config = 'vim.cmd[[COQnow]]'
}
use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
  end
)

vim.cmd [[set termguicolors]]
vim.api.nvim_command [[colorscheme catppuccin]]

require('lualine').setup {
  options = {
    theme = "catppuccin"
  }
}

vim.opt.termguicolors = true
require("bufferline").setup{}
require('neoscroll').setup()
vim.notify = require("notify")
