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

require("neoscroll").setup()
require("nvim-lsp-installer").setup {}
require("which-key").setup {}
