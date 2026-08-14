-- python lsp
vim.lsp.config("suhpy", {
    cmd = { 'basedpyright-langserver', '--stdio' },
	-- cmd = { "zuban", "server" },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
    },

    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
                autoImportCompletions = true,
                autoFormatStrings = true,
                inlayHints = {
                    callArgumentNames = true,
                    callArgumentNamesMatching = true,
                }
            }
        }
    },

    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
        -- omnifunc autotrigger on char
        vim.keymap.set("i", ".", ".<C-X><C-O>", { remap = false })
        vim.keymap.set("i", "(", "(<C-X><C-O>", { remap = false })
    end
})
vim.lsp.enable("suhpy")


-- typst lsp
vim.lsp.config("typstlsp",  {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable"
    },

    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.enable("typstlsp")

vim.lsp.config("clangd", {
    cmd = { 'clangd', '--background-index' },
    root_markers = { ".git"},
    filetypes = { 'c', 'cpp' , "cuda"},
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
        -- omnifunc autotrigger on char
        vim.keymap.set("i", ".", ".<C-X><C-O>", { remap = false })
        vim.keymap.set("i", "(", "(<C-X><C-O>", { remap = false })
        vim.keymap.set("i", ">", "><C-X><C-O>", { remap = false })
    end,
})
vim.lsp.enable({'clangd'})

-- show pop up menu
vim.cmd("set completeopt=fuzzy,menuone,popup,noselect")

-- keymaps for interacting with autocomplete
-- suggestions
vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() == 1 then
        return '<C-n>'
    else
        return '<Tab>'
    end
end, { expr = true, remap = false })

vim.keymap.set('i', '<S-Tab>', function()
    if vim.fn.pumvisible() == 1 then
        return '<C-p>'
    else
        return '<S-Tab>'
    end
end, { expr = true, remap = false })

vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then
        return '<C-y>'
    else
        return '<CR>'
    end
end, { expr = true, remap = false })


-- keymaps for using lsp functions
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
