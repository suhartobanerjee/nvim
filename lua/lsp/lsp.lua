vim.cmd("set completeopt=fuzzy,menuone,popup,noselect")

vim.lsp.config["suhpy"] = {
    name = "basedpyright",

    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },

    on_attach = function(client, bufnr)

        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })

        local opts = {buffer = bufnr}

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

        vim.keymap.set('i', '<Tab>', function()
            return vim.fn.pumvisible() == 1 and '<C-n>'
        end, { expr = true, remap = false })

        vim.keymap.set('i', '<S-Tab>', function()
            return vim.fn.pumvisible() == 1 and '<C-p>'
        end, { expr = true, remap = false })

        vim.keymap.set('i', '<CR>', function()
            return vim.fn.pumvisible() == 1 and '<C-y>'
        end, { expr = true, remap = false })

    end
}


vim.lsp.enable("suhpy")


vim.lsp.config["typstlsp"] = {
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
}

vim.lsp.enable("typstlsp")
