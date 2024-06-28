return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      diagnostics = {
        float = {
          border = "single",
          focus = false,
          source = "if_many",
        },
        severity_sort = true,
        signs = {
          Error = "",
          Hint = "",
          Info = "",
          Warn = "",
        },
        update_in_insert = false,
        virtual_text = false,
      },
      capabilities = {},
      autoformat = true,
      servers = {
        dockerls = {},
        jsonls = {},
        lua_ls = {},
        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
              },
            },
          },
        },
        sqlls = {},
        tsserver = {},
        terraformls = {
          filetypes = { "terraform", "terraform-vars", "tf", "tfvars" },
        },
        yamlls = {},
      },
      setup = {},
    },
    config = function(_, opts)
      local servs = opts.servers

      -- Define diagnostic signs to show next to each line
      for type, icon in pairs(opts.diagnostics.signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      opts.diagnostics.signs = nil
      vim.diagnostic.config(opts.diagnostics)
      vim.o.updatetime = 250
      vim.cmd([[autocmd! CursorHold * lua vim.diagnostic.open_float() ]])

      local function setup(server)
        local server_opts = servs[server] or {}

        if not opts.setup[server] then
          require("lspconfig")[server].setup(server_opts)
          return
        end

        opts.setup[server](server, server_opts)
      end

      local mlsp = require("mason-lspconfig")
      local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      local ensure_installed = {}

      for server, server_opts in pairs(servs) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts

          if not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mlsp.setup({ ensure_installed = ensure_installed })
      mlsp.setup_handlers({ setup })
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        -- "black",
        "debugpy",
        "eslint_d",
        "prettier",
        -- "pylint",
        "ruff-lsp",
        "shfmt",
        -- "sqlfluff",
        "stylua",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      local mr = require("mason-registry")

      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
