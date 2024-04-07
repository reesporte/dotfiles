vim.cmd('compiler cargo')
if vim.fn.executable('rust-analyzer') == 1 then
    vim.lsp.start({
        name = 'rust-analyzer server',
        cmd = { 'rust-analyzer' },
        root_patterns = { 'Cargo.toml' },
        settings = {
            ['rust-analyzer'] = {
              imports = {
                prefix = 'self',
                granularity = { group = 'module' },
              },
              cargo = { buildScripts = { enable = true } },
              procMacro = { enable = true },
            },
        },
    })
end

