
local present, lsp = pcall(require, "lsp-zero")
if not present then
    print('lsp-zero not present')
    return
end


local present, null_ls = pcall(require, "null-ls")
if not present then
    print('null-ls not present')
    return
end

local null_opts = lsp.build_options('null-ls', {
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end
})

-- set installed lsp
lsp.ensure_installed({
  "angularls",
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "lua_ls",
})

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
  }
})

lsp.setup()


