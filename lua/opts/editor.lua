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
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3


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


-- neovide specific settings
if vim.g.neovide then
    vim.g.neovide_scale_factor = 1.2
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_progress_bar_animation_speed = 0
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_remember_window_size = true
end
