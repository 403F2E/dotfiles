local options = {
  formatters_by_ft = {
    python = { "ruff" },
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    php = { "phpcbf" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
