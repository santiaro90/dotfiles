return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      file_selector = {
        provider = "fzf",
      },
      hints = { enabled = false },
      mappings = {
        diff = {
          all_theirs = "doa",
          both = "dob",
          cursor = "doc",
          ours = "doo",
          theirs = "dot",
        },
        submit = {
          insert = "<CR>",
        },
      },
      provider = "copilot_claude",
      vendors = {
        copilot_claude = {
          __inherited_from = "copilot",
          api_key_name = "GITHUB_TOKEN",
          model = "claude-3.5-sonnet",
          max_tokens = 4096,
        },
      },
      windows = {
        input = {
          prefix = " ",
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
