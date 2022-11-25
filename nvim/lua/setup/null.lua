-- Setup null-ls

local null_ls = require 'null-ls'

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.ltrs,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.stylua,
	},
})
