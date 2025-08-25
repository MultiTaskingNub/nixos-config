return{
cmd = {'lua-language-server'},
filetypes = {'lua'},
root_markers = {},
settings = {
  Lua = {
    workspace = {
      library = { vim.env.VIMRUNTIME },
    }
  }
}

}
