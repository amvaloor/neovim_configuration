return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',

        opts = {
            keymap = {
                preset = 'super-tab',
                ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            },

            appearance = {
                nerd_font_variant = 'mono'
            },

            signature = {
                enabled = true,
                window = {
                    border = 'rounded',
                },
            },

            completion = {
                ghost_text = { enabled = true },
                documentation = { auto_show = true },
                accept = { auto_brackets = { enabled = true } },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    }
                }
            },

            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },

        },
        opts_extend = { "sources.default" }
    }
}
