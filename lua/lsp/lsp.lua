-- python lsp
vim.lsp.config("pylsp", {
    -- cmd = { 'basedpyright-langserver', '--stdio' },
	-- cmd = { "zuban", "server" },
    name = "pylsp",
    cmd = { "pylsp" },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },

    -- settings = {
    --     typeCheckingMode = "off",
    --     diagnosticMode = "workspace"
    -- },

    settings = {
        pylsp = {
            -- configurationSources = { "ruff" },
            plugins = {
                jedi_completion = { 
                    enabled = true,
                    fuzzy = true,
                },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_symbols = { enabled = true },
                ruff = { 
                    enabled = false,  -- Enable the plugin
                },
                --     formatEnabled = true,  -- Enable formatting using ruffs formatter

                -- --     -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                -- --     lineLength = 100,  -- Line length to pass to ruff checking and formatting
                -- --     exclude = { "__about__.py" },  -- Files to be excluded by ruff checking
                -- --     ignore = { 'W391', "E501", "E126" },  -- Rules to be ignored by ruff
                -- --     perFileIgnores = { ["__init__.py"] = "CPY001" },  -- Rules that should be ignored for specific files
                --     select = { "E", "F", "W", "I" },
                -- --     --preview = false,  -- Whether to enable the preview style linting and formatting.
                -- },
                pycodestyle = { 
                    enabled = true,
                    ignore = { 'W391', "E501", "E126", "E402" },  -- Rules to be ignored by ruff
                },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
            }
        }
    },

    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.enable("pylsp")


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
