local util = require('lspconfig/util')

local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python') end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then require('nvim-navic').attach(client, bufnr) end
end

vim.lsp.enable('cssls', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('eslint', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('deno', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.config('deno', {
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  cmd = { 'deno', 'lsp' },
  root_markers = { 'deno.lock', 'deno.json' },
  workspace_required = true,
})
-- vim.lsp.enable('gopls', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('graphql', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('html', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('lua_ls', { capabilities = capabilities, on_attach = on_attach })
vim.lsp.enable('pyright', {
  capabilities = capabilities,
  on_attach = on_attach,
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportPrivateImportUsage = 'none',
        },
      },
    },
  },
  on_init = function(client) client.config.settings.python.pythonPath = get_python_path(client.config.root_dir) end,
})
-- vim.lsp.enable('ty', {
--   capabilities = capabilities,
--   on_attach = function(client, bufnr)
--     if client.server_capabilities.documentSymbolProvider then require('nvim-navic').attach(client, bufnr) end
--     vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
--       local params = {
--         command = 'pyright.organizeimports',
--         arguments = { vim.uri_from_bufnr(bufnr) },
--       }
--
--       -- Using client.request() directly because "pyright.organizeimports" is private
--       -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
--       -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
--       client.request('workspace/executeCommand', params, nil, bufnr)
--     end, {
--       desc = 'Organize Imports',
--     })
--     vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
--       desc = 'Reconfigure pyright with the provided python path',
--       nargs = 1,
--       complete = 'file',
--     })
--   end,
--   root_markers = {
--     'pyproject.toml',
--     'setup.py',
--     'setup.cfg',
--     'requirements.txt',
--     'Pipfile',
--     'pyrightconfig.json',
--     '.git',
--   },
--   settings = {
--     python = {
--       analysis = {
--         diagnosticSeverityOverrides = {
--           reportPrivateImportUsage = 'none',
--         },
--       },
--     },
--   },
--   on_init = function(client) client.config.settings.python.pythonPath = get_python_path(client.config.root_dir) end,
-- })
vim.lsp.enable('ruff', { capabilities = capabilities, on_attach = on_attach })
-- vim.lsp.enable('rust_analyzer', { capabilities, on_attach = on_attach, })
-- vim.lsp.enable('svelte', { capabilities = capabilities, on_attach = on_attach })
-- vim.lsp.enable('terraformls', { capabilities = capabilities, on_attach = on_attach })
-- vim.lsp.enable('ts_ls', { capabilities = capabilities, on_attach = on_attach })
-- vim.lsp.enable('yamlls', {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     yaml = {
--       schemas = { kubernetes = '*.yaml' },
--     },
--   },
-- })

-- LSP diagnostics show only on hover
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
})

local x = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = { prefix = '' },
  signs = { text = { [x.ERROR] = ' ', [x.WARN] = ' ', [x.INFO] = ' ', [x.HINT] = ' ' } },
  underline = true,
})
