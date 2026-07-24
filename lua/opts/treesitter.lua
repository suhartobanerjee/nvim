require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require("nvim-treesitter").install {
	"python", "c", "cpp", "snakemake", "r", "rust", "lua", "typst"
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', "r", "snakemake", "cpp", "c", "cuda", "rust" , "lua"},
  callback = function() 
      vim.treesitter.start() 
  end
})

