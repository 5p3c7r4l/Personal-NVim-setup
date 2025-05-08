-- PYTHON --
vim.lsp.enable('pyright')
vim.lsp.config('pyright',{
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            }
        }
    }
})

-- JAVASCRIPT/TYPESCRIPT --
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
vim.lsp.enable('denols')
vim.lsp.config('denols',{
    cmd = { "deno", "lsp" },
    cmd_env = {NO_COLOR = true},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_markers = { "deno.json", "deno.jsonc", ".git" },
    settings = {
        deno = {
            enable = true,
            suggest = {
                imports = {
                    hosts = {
                        ["https://deno.land"] = true
                    }
                }
            }
        }
    }
})

