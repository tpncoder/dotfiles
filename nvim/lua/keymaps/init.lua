--keymaps
local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

vim.g.mapleader = " "

keymap("n","<leader>q",":q", { noremap = true  })
keymap("n","<leader>i",":PaqInstall", { noremap = true})
keymap("n","<leader>h",":sp", { noremap = true })
keymap("n","<leader>v",":vsp", { noremap = true })
keymap("n","<leader>op", ":NvimTreeToggle<cr>",  { noremap = true })
keymap("n","<leader>w", ":WhichKey", { noremap = true })
keymap("n","<leader>tc",":Telescope colorscheme<cr>", { noremap = true })
keymap("n","<leader>ff",":Telescope find_files<cr>", { noremap = true })
keymap("n","<leader>fo",":Telescope oldfiles<cr>", { noremap = true })
keymap("n","<leader>bm",":Telescope marks<cr>", { noremap = true })
keymap("n","<leader>fw",":Telescope live_grep<cr>", { noremap = true })
keymap("n","<C-d>",":Alpha", { noremap = true })

vim.cmd[[nnoremap <C-d> :Alpha]]
local keymap_g = {
    name = "Goto",
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
  }
