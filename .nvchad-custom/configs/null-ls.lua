local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  b.formatting.black.with({
    extra_args = {"--line-length=82"}
  }),

  -- b.diagnostics.pylint.with({
  --     diagnostic_config = { underline = false, virtual_text = false, signs = false },
  --     method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  -- }),
	
  b.formatting.rustfmt,
}


null_ls.setup {
  debug = true,
  sources = sources,
}
