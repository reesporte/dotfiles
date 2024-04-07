vim.cmd('compiler go')
if vim.fn.executable('gopls') == 1 then
    vim.lsp.start({
        name = 'gopls server',
        cmd = { 'gopls' },
        root_patterns = { 'go.mod' },
    })
end

