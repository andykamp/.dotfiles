require("catppuccin").setup({
    term_colors = true,
    transparent_background = false,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
    },
    color_overrides = {
        mocha = {
            rosewater = "#ebc0b8", -- "#f5e0dc",
            flamingo = "#e9aaaa",  -- "#f2cdcd",
            pink = "#ef9cd8",      -- "#f5c2e7",
            mauve = "#b580f4",     -- "#cba6f7",
            red = "#ef688e",       -- "#f38ba8",
            maroon = "#e47f8f",    -- "#eba0ac",
            peach = "#f89c62",     -- "#fab387",
            yellow = "#f6d488",    -- "#f9e2af",
            green = "#8ada83",     -- "#a6e3a1",
            teal = "#77dac9",      -- "#94e2d5",
            sky = "#69d3e6",       -- "#89dceb",
            sapphire = "#55bbe8",  -- "#74c7ec",
            -- blue = "#649cf8",      -- "#89b4fa",
            lavender = "#8999fd",  -- "#b4befe",

            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    },
    integrations = {
        lsp_saga = true,
        gitsigns = true,
        treesitter = true,
        markdown = true,
        fidget = true,
        mason = true,
        -- neotest = true,
        -- telescope = {
        --     enabled = true,
        --     style = "nvchad",
        -- },
        indent_blankline = {
            enabled = false,
            scope_color = "surface1", -- text
        },
        illuminate = true,
        dropbar = {
            enabled = true,
            color_mode = true,
        },
        lsp_trouble = true,
        -- which_key = true
    },
})
