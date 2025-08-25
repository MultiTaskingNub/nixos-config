return{
  {
	  "nvim-treesitter/nvim-treesitter", 
	  branch = 'master', 
	  opts ={
		highlight = { enable = true },
	  },
	  lazy = false,
	  build = ":TSUpdate"}
}
