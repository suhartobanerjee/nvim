-- Indenting behaviour
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true


-- Settings regarding backup files and 
-- undo, swapfile and so on
vim.opt.backup = false 
vim.opt.writebackup = false 
vim.opt.swapfile = false 
vim.opt.undofile = false 


-- set mouse usage on
vim.opt.mouse = 'a'


-- setting line numbers and 
-- relative ln numbers
vim.opt.number = true
vim.opt.relativenumber = true


-- show the line, col and % in file
-- scroll
vim.opt.ruler = true


-- setting backspace options
vim.opt.backspace = {'indent', 'eol', 'start'}


-- search options
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Show concealed text only in i mode
-- perfect for md files. Shows text 
-- formatting in ins and vis mode
vim.g.indentLine_concealcursor = "nv"


-- set the error display col
vim.opt.signcolumn = 'yes'


-- disable bell
vim.opt.belloff = 'all'



-- Show numbers in netrw
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'


-- line at col 80
--vim.opt.colorcolumn = '80'

-- set snakemake filetype when opening snakefile
vim.filetype.add({
    filename = {
        ['snakefile'] = 'snakemake',
        ['Snakefile'] = 'snakemake',
    },
    extension = {
        smk = 'snakemake',
    },
})


vim.opt.foldmethod = "indent"

-- general autocomplete behaviour
vim.opt.autocomplete = true

local opts = { remap = false }

-- file path completion remap
vim.keymap.set("i", "<C-F>", "<C-X><C-F>", opts)

-- auto bracket closing behaviour
-- vim.keymap.set("i", "(", "()<Esc>i", opts)
-- vim.keymap.set("i", "{", "{}<Esc>i", opts)
-- vim.keymap.set("i", "[", "[]<Esc>i", opts)
-- vim.keymap.set("i", "<", "<><Esc>i", opts)
-- vim.keymap.set("i", "\"", "\"\"<Esc>i", opts)
