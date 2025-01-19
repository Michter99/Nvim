function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.cmd([[
	highlight TabLine     guibg=#282c34 guifg=#abb2bf
	highlight TabLineSel  guibg=#61afef guifg=#282c34
	highlight TabLineFill guibg=#1e222a guifg=#1e222a
	]])
end

ColorMyPencils()
