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



return require('packer').startup({function()
		use {'wbthomason/packer.nvim'}

		--some shit
	  	use "nvim-telescope/telescope.nvim"
	  	use "nvim-treesitter/nvim-treesitter"
	 	use "kyazdani42/nvim-tree.lua"
	 	use "kyazdani42/nvim-web-devicons"
	  	use "nvim-lua/plenary.nvim"
	  	use "folke/which-key.nvim"
		--use "ms-jpq/chadtree"

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
		use 'kdheepak/monochrome.nvim'
		use 'frenzyexists/aquarium-vim'

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
	  	use "jose-elias-alvarez/null-ls.nvim"
		use 'onsails/lspkind.nvim'

		--icing of the cake
	 	use "rcarriga/nvim-notify"
		use "nvim-lualine/lualine.nvim"
	 	use 'akinsho/bufferline.nvim'
	  	use 'goolord/alpha-nvim'
	  	use "akinsho/toggleterm.nvim"
		use 'junegunn/rainbow_parentheses.vim'
		use 'norcalli/nvim-colorizer.lua'

	  	use "pangloss/vim-javascript"
	  	use "airblade/vim-gitgutter"
		use 'ellisonleao/glow.nvim'
		use "mhartington/formatter.nvim"
  	  	use "alvan/vim-closetag"
	  	use "jiangmiao/auto-pairs"
		use 'Pocco81/TrueZen.nvim'
        	use "lukas-reineke/indent-blankline.nvim"
		use "frabjous/knap"

	  if packer_bootstrap then
    		require('packer').sync()
  		end
	end,
	config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})


