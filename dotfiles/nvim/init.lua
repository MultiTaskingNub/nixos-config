require('config.lazy')
require('config.keymap')

vim.cmd('colorscheme kanagawa-wave')

vim.g.typst_preview_browser = 'xdg-open'

vim.o.rnu = true
vim.o.showmode = false
vim.o.number = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.cmd('highlight CursorLineNr guifg=#ffcc00 gui=bold')

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Setting up Inline diagnostic
vim.diagnostic.config({
  virtual_text = true,
})
vim.api.nvim_create_autocmd("TextChangedI", {
  pattern = "*.typ",
  callback = function()
    vim.cmd("w")
  end,
})

