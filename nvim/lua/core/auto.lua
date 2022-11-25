-- Autocommands and groups

-- Auto group and command respectively
local ag = vim.api.nvim_create_augroup
local ac = vim.api.nvim_create_autocmd

-- Yank highlihght
ag("YankHighlight", { clear = true })
ac("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = "500",
		})
	end,
})

-- Clear white space
ac("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

ac("BufWritePre", {
	pattern = "",
	command = ":lua vim.lsp.buf.format()",
})

-- Do not autocomment new lines
ac("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

-- File types

-- Disable line length marker
ag("setLineLength", { clear = true })
ac("Filetype", {
	group = "setLineLength",
	pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
	command = "setlocal cc=0",
})

-- Set indentation to 2 spaces
ag("setIndent", { clear = true })
ac("Filetype", {
	group = "setIndent",
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

-- Terminal settings:

-- Open a Terminal on the right tab
ac("CmdlineEnter", {
	command = "command! Term :botright vsplit term://$SHELL",
})

-- Enter insert mode when switching to terminal
ac("TermOpen", {
	command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

ac("TermOpen", {
	pattern = "",
	command = "startinsert",
})

-- Close terminal buffer on process exit
ac("BufLeave", {
	pattern = "term://*",
	command = "stopinsert",
})
