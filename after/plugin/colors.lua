function ColorMyPencils(color)
	vim.cmd.colorscheme "rose-pine-moon"
	vim.cmd([[
	highlight TabLine     guibg=#282c34 guifg=#abb2bf
	highlight TabLineSel  guibg=#6742a8 guifg=#282c34
	highlight TabLineFill guibg=#1e222a guifg=#1e222a
	]])
end

ColorMyPencils()
