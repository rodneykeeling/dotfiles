local util = require("lspconfig/util")

local path = util.path

local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Find and use virtualenv from pipenv in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "Pipfile"))
    if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system("PIPENV_PIPFILE=" .. match .. " pipenv --venv"))
        return path.join(venv, "bin", "python")
    end

    -- Fallback to system Python.
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end


local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end
end

require "lspconfig".cssls.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".eslint.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".gopls.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".graphql.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".html.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".lua_ls.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportPrivateImportUsage = "none",
                }
            }
        }
    },
    on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
    end
}
require "lspconfig".ruff_lsp.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".rust_analyzer.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".svelte.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".tsserver.setup { capabilities = capabilities, on_attach = on_attach, }
require "lspconfig".yamlls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        yaml = {
            schemas = { kubernetes = "*.yaml" },
        }
    }
}

-- LSP diagnostics show only on hover
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
    }
)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
