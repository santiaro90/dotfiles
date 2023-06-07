local servers = {
  dockerls = {},
  groovyls = {},
  jsonls = {},
  pyright = {},
  sqlls = {},
  tsserver = {},
}

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
      servers = servers,
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
      vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float() ]]


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
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      return {
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end
            })
          end
        end,
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.pylint,
          nls.builtins.formatting.black,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.prettier,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = vim.tbl_keys(servers),
    },
    config = function(_, opts)
      require("mason").setup(opts)

      local registry = require("mason-registry")
      local server_mappings = require("mason-lspconfig.mappings.server").lspconfig_to_package

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = registry.get_package(server_mappings[tool])

          if not p:is_installed() then
            p:install()
          end
        end
      end

      if registry.refresh then
        registry.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
