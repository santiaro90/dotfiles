return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },
      cmdline = { enabled = false },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        documentation = { auto_show = false },
        ghost_text = { enabled = true },
        keyword = { range = "full" },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      keymap = {
        preset = "super-tab",
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "copilot",
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
