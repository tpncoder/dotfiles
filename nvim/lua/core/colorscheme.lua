--colorscheme
vim.api.nvim_command [[colorscheme catppuccin]]
vim.cmd[[set noshowmode]]


local function colorTime(name)
	local tableTime = os.date("*t")
	local hour = tableTime.hour
	
	if hour < 13 then
		vim.g.catppuccin_flavour = "latte"
		vim.cmd[[catppuccin]]
	elseif hour >= 13 and hour < 16 then
		vim.g.catppuccin_flavour = "frappe"
		vim.cmd[[catppuccin]]
	elseif hour >= 16 and hour < 19 then
		vim.g.catppuccin_flavour = "macchiato"
		vim.cmd[[catppuccin]]	
	elseif hour >= 19 then
		vim.g.catppuccin_flavour = "mocha"
		vim.cmd[[catppuccin]]
	end
end
