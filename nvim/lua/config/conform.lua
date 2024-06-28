local conform = require("conform")

local ignore_filetypes_on_save = { "sql", "java", "javascript", "typescript", "tsx", "typescriptreact" }

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofumpt" },
        json = { "deno_fmt" },
    },
    formatters = {
        shfmt = {
            prepend_args = { "-i", "2" },
        },
    },

    format_on_save = function(buffer)
        if vim.g.disable_autoformat or vim.b[buffer].disable_autoformat then
            return
        end

        if vim.tbl_contains(ignore_filetypes_on_save, vim.bo[buffer].filetype) then
            return
        end

        local bufname = vim.api.nvim_buf_get_name(buffer)
        if bufname:match("/node_modules/") then
            return
        end

        return {
            timeout_ms = 500,
            lsp_fallback = true,
        }
    end,
})

-- Disable autoformatting command
vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, { desc = "disable autoformat-on-save", bang = true })

-- Enable autoformatting command
vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, { desc = "re-enable autoformat-on-save" })

-- Keymap for manually formatting the buffer
vim.keymap.set("n", "<leader>l", function()
    conform.format({ async = false, lsp_fallback = true })
    vim.defer_fn(function()
        vim.cmd("EslintFixAll")
    end, 100)
end, { desc = "for[m]at buffer" })

-- Keymap for toggling autoformat on save
vim.keymap.set("n", "<leader>cM", function()
    if vim.b.disable_autoformat or vim.g.disable_autoformat then
        vim.cmd("FormatEnable")
    else
        vim.cmd("FormatDisable")
    end
end, { desc = "for[M]at on save" })

-- Set formatexpr for using conform's format expression
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
