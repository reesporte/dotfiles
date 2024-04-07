vim.cmd('compiler go')
if vim.fn.executable('gopls') == 1 then
    vim.lsp.start({
        name = 'gopls server',
        cmd = { 'gopls' },
        root_dir = vim.fs.dirname(vim.fs.find({'go.mod'}, { upward = true })[1])
    })
end

