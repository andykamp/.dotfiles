require("nvim-lsp-installer").setup {}
-----------------------------------------------------------------------------
-- LSP settings
-----------------------------------------------------------------------------

local lspconfig = require 'lspconfig'

-- on_attach for all servers
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    -- require("aerial").on_attach(_, bufnr)
    --go-to definition etc
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- goes to where it is defined
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>vsplit<CR><cmd>wincmd l<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', ':vs<CR> <cmd>lua vim.lsp.buf.definition()<CR>', opts) -- goes to where it is defined
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- quiclist of all references
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

    -- formatting on buffer AND an visual selection
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>lua vim.lsp.buf.format({ filter = function(client) return client.name == "null-ls" end, bufnr = bufnr})<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>l', '<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

    -- rename
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- renames inside the current buffer

    -- info
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- gives a list of action the IDE can do for you
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
        [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts) -- list all variables in float

    -- diagnostics
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '-', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '_', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>-', '<cmd>TroubleToggle<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>-', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- shows the error message in a float

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buftype_definition()<CR>', opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]] -- TODO do i need ?
end

-- @todo does not work...
-- make sure refertences do not open quicjlist
-- vim.lsp.handlers['textdocument/references'] = function(_, result)
--     vim.g.lsp_last_word = vim.fn.expand('<cword>')
--     if not result then return end
--     if #result == 0 then
--         vim.cmd [[ echo "getting references..."]]
--         return
--     end
--     vim.cmd [[ echo ""]]
--     local util = require('vim.lsp.util')
--     -- util.set_qflist(util.locations_to_items(result))
--     -- require('plugins.fzf').quickfix(vim.fn.expand('<cword>'));
--     -- api.nvim_command("copen")
--     -- api.nvim_command("wincmd p")
-- end


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'pyright', 'tsserver', 'tailwindcss', 'graphql' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- -- tsserver spesific setup
-- lspconfig.tsserver.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { vim.env.HOME .. "/.local/share/nvim/lsp_servers/tsserver/node_modules/.bin/typescript-language-server",
--         "--stdio" },
-- }

-- -- tailwind spesific setup
-- lspconfig.tailwindcss.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "tailwindcss-language-server", "--stdio" },
--     -- { vim.env.HOME .. "/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/.bin/tailwindcss-language-server", "--stdio" },
--     single_file_support = false,
--     root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts', 'package.json', 'node_modules', '.git')
-- }

-- @todo: remove no longer used but does not use the lua_ls either
-- lua spesific setyp
-- Make runtime files discoverable to the server
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
-- table.insert(runtime_path, '/tmp/nvim/?.lua')
-- table.insert(runtime_path, '/tmp/nvim/lua/?.lua')

-- lspconfig.sumneko_lua.setup {
--     cmd = { vim.env.HOME .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server" },
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--                 -- Setup your lua path
--                 path = runtime_path,
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file('', true),
--                 checkThirdParty = false,
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- }

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- -- svelte spesific setup
-- lspconfig.svelte.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "svelte" },
--     settings = {
--         plugin = {
--             html = { completions = { enable = true, emmet = false } },
--             svelte = { completions = { enable = true, emmet = false } },
--             css = { completions = { enable = true, emmet = true } },
--         },
--     },
-- })

-- grapql spesific setup
-- lspconfig.graphql.setup {}



