return {
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      copilot_model = "gpt-4o-copilot",
      filetypes = { yaml = true },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        keymap = { accept = false },
      },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
}
