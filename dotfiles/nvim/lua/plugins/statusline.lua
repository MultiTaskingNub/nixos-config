return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
	theme = 'kanagawa-dragon ',
	section_separators = { left = '', right = '' },
	component_separators = { left = '', right = '' },
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'filename'},
		lualine_c = {'lsp_status'},
		lualine_x = {'branch'}

	}
    }
}
