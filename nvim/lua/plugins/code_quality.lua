return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        python = { "ruff" },
        sql = { "sqlfluff" },
      },
      linters = {
        sqlfluff = {
          cmd = "sqlfluff",
          args = { "lint", "-f", "json", "-t" },
        },
      }
    },
    config = function(_, opts)
      local Util = require("lazy.core.util")

      local M = {}

      local lint = require("lint")
      for name, linter in pairs(opts.linters) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
        else
          lint.linters[name] = linter
        end
      end
      lint.linters_by_ft = opts.linters_by_ft

      function M.debounce(ms, fn)
        local timer = vim.loop.new_timer()
        return function(...)
          local argv = { ... }
          timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
          end)
        end
      end

      function M.lint()
        -- Use nvim-lint's logic first:
        -- * checks if linters exist for the full filetype first
        -- * otherwise will split filetype by "." and add all those linters
        -- * this differs from conform.nvim which only uses the first filetype that has a formatter
        local names = lint._resolve_linter_by_ft(vim.bo.filetype)

        -- Add fallback linters.
        if #names == 0 then
          vim.list_extend(names, lint.linters_by_ft["_"] or {})
        end

        -- Add global linters.
        vim.list_extend(names, lint.linters_by_ft["*"] or {})

        -- Filter out linters that don't exist or don't match the condition.
        local ctx = { filename = vim.api.nvim_buf_get_name(0) }
        ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
        names = vim.tbl_filter(function(name)
          local linter = lint.linters[name]
          if not linter then
            Util.warn("Linter not found: " .. name, { title = "nvim-lint" })
          end
          return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
        end, names)

        -- Run linters.
        if #names > 0 then
          lint.try_lint(names)
        end
      end

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = M.debounce(100, M.lint),
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    cmd = "ConformInfo",
    opts = {
      formatters = {
        sqlfluff = {
          args = { "format", "-" },
          cwd = function()
            require("conform.util").root_file({ ".sqlfluff" })
          end,
        },
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        lua = { "stylua" },
        python = {
          "isort",
          "ruff_fix",
          "ruff_format",
        },
        sh = { "shfmt" },
        sql = { "sqlfluff" },
        typescript = { "prettier" },
        zsh = { "shfmt" },
      },
      lsp_fallback = true,
    },
  },
}
