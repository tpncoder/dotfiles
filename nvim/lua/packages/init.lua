local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[packadd packer.nvim]]
--packages


return require('packer').startup(function()
  	  	use "savq/paq-nvim"
		use 'wbthomason/packer.nvim'
	
		--some shit
	  	use "nvim-telescope/telescope.nvim"
	  	use "nvim-neo-tree/neo-tree.nvim"
		use "MunifTanjim/nui.nvim"
	  	use "nvim-treesitter/nvim-treesitter"
	 	use "kyazdani42/nvim-tree.lua"
	 	use "kyazdani42/nvim-web-devicons"
	  	use "nvim-lua/plenary.nvim"
	  	use "folke/which-key.nvim"

		--colorschemes
	  	use "catppuccin/nvim"
	  	use "arcticicestudio/nord-vim"
 	  	use "dracula/vim"
	  	use "folke/tokyonight.nvim"
		use 'navarasu/onedark.nvim'
		use "ellisonleao/gruvbox.nvim"
		use 'NTBBloodbath/doom-one.nvim'
		use 'tomasiser/vim-code-dark'
		use 'rebelot/kanagawa.nvim'

		--completion and lsp
	  	use "hrsh7th/vim-vsnip"
	  	use "hrsh7th/vim-vsnip-integ"
	  	use "neovim/nvim-lspconfig"
	  	use "hrsh7th/cmp-nvim-lsp"
	  	use "hrsh7th/cmp-buffer"
	  	use "hrsh7th/cmp-path"
	  	use "hrsh7th/cmp-cmdline" 
	  	use "hrsh7th/nvim-cmp"
	  	use "L3MON4D3/LuaSnip"
	  	use "saadparwaiz1/cmp_luasnip"
	  	use "williamboman/nvim-lsp-installer"
		use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = function()
			require("trouble").setup {}
		end}

		--icing of the cake
	 	use "rcarriga/nvim-notify"
		use "nvim-lualine/lualine.nvim"
	 	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	        use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
		--"glepnir/dashboard-nvim"
	  	use "karb94/neoscroll.nvim"
		use 'feline-nvim/feline.nvim'
	  	--'itchyny/lightline.vim'
	  	use 'goolord/alpha-nvim'
	  	use "akinsho/toggleterm.nvim"
		use "noib3/nvim-cokeline"
		use 'kdheepak/tabline.nvim'
		use 'alvarosevilla95/luatab.nvim'
		use 'voldikss/vim-floaterm'

	  	use "lervag/vimtex"
	  	use "mattn/efm-langserver"
	  	use "pangloss/vim-javascript"
	  	use "MaxMEllon/vim-jsx-pretty"
	  	use "airblade/vim-gitgutter"
	  	use "tpope/vim-unimpaired"
	  	use "tpope/vim-surround"
		use 'ellisonleao/glow.nvim'
		use "mhartington/formatter.nvim"
  	  	use "alvan/vim-closetag"
	  	use "jiangmiao/auto-pairs"
		use 'Pocco81/TrueZen.nvim'
        	use "lukas-reineke/indent-blankline.nvim"
		use {'s1n7ax/nvim-terminal', config = function() vim.o.hidden = true 
		require('nvim-terminal').setup() end,}
		use "frabjous/knap"
		use 'davidgranstrom/nvim-markdown-preview'
end)


