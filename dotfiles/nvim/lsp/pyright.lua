return{
cmd = {'pyright-langserver', '--stdio'},
filetypes = {'python'},
root_markers = {},
settings = {
  python = {
    workspace = {
      -- Tell LuaLS where the vim.* variables come from.
      -- See ':=vim.env.VIMRUNTIME' to see what this is; it's a directory to Neovim's Lua source code.
      library = { vim.env.VIMRUNTIME },
    }
  }
}

}
