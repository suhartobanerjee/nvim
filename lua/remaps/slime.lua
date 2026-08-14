function customPythonMappings()
    vim.g.maplocalleader = "\\"

    local opts = {silent = true}

    -- to split and open terminal
    vim.keymap.set('n', '<localleader>ps', ':botright split | resize 21<CR>:term<CR>iconda activate $CDE<CR>ipython<CR><C-\\><C-n><C-W>k:SlimeConfig<CR><CR>', opts)

    vim.keymap.set({'n', 'i', 'v'}, '<localleader>cf', '<Esc>:SlimeConfig<CR>')
    vim.keymap.set({'n', 'i', 'v'}, '<localleader><CR>', '<Esc>:lua sendIndentedBlock()<CR>i')
    vim.keymap.set('v', '<localleader><CR>', ":'<,'>SlimeSend<CR>`>ji")
    vim.keymap.set({'n', 'i', 'v'}, '<localleader>ff', '<Esc>:lua sendFunctionBlock()<CR>i')
end


function sendIndentedBlock()
    -- Get the current line number and its indentation level
    local current_line = vim.fn.line('.')
    local current_indent = vim.fn.indent(current_line)

    -- setting starting marker after removing previous marks
    vim.cmd("delm PN")
    vim.cmd("mark P")

    -- determining the end_line based on indentation
    local end_line = current_line
    local diff = 0
    while end_line < vim.fn.line('$') and vim.fn.indent(end_line + 1) > current_indent do
        end_line = end_line + 1
        diff = diff + 1
    end

    -- setting ending mark
    vim.fn.execute(end_line)
    vim.cmd("mark N")
    -- Save the indented block to a temporary buffer
    if diff > 0 then
        --vim.cmd("normal V" .. diff .. "j")
        vim.cmd("'P,'NSlimeSend")
    else
        --vim.cmd("normal V")
        vim.cmd("'PSlimeSend")
    end

    -- Execute SlimeSend with the indented block

    -- move to end_line
    end_line = end_line + 1
    vim.fn.execute(end_line)
end


function sendFunctionBlock()
    -- Get the current line number and its indentation level
    local current_line = vim.fn.line('.')
    local current_indent = vim.fn.indent(current_line)
    local end_line = current_line

    -- setting starting marker after removing previous marks
    vim.cmd("delm PN")
    vim.cmd("mark P")

    -- checking if two consecutive lines are empty
    -- to signal the end of the function
    while end_line < vim.fn.line('$') do
        if (vim.fn.indent(end_line + 1) == current_indent and 
            vim.fn.indent(end_line + 2) == current_indent) then
           vim.fn.execute(end_line)
           vim.cmd("mark N")
           break
        end
        end_line = end_line + 1
    end

    -- sending to slime and moving to the 
    -- line + 3 to start typing
    vim.cmd("'P,'NSlimeSend")
    vim.fn.execute(end_line + 3)
end


-- Set these shortcuts only for r buffers
vim.api.nvim_create_augroup('slimePython', {clear = true})
vim.api.nvim_create_autocmd('Filetype', {
    callback = function() customPythonMappings() end,
    pattern = {'py', 'python'},
    group = 'slimePython'
})
