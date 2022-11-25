-- Color configuration from brainfucksec/neovim-lua

-- local status_ok, color_scheme = pcall(require, "solarized")
-- if not status_ok then
-- 	return
-- end

-- color_scheme.set()

-- Chage this to gruvbox or ayu
local colorscheme = "ayu"

vim.o.background = "dark"

-- ayu, ayu-{dark, light, mirage}
vim.api.nvim_cmd({
	cmd = "colorscheme",
	args = {
		colorscheme,
	},
}, {})

local M = {}

local ok, gruvbox = pcall(require, "gruvbox.palette")
if not ok then
	return
else
	local col_fg, col_bg
	if vim.o.background == "light" then
		col_fg = gruvbox.dark0_soft
		col_bg = gruvbox.light0_soft
	else
		col_fg = gruvbox.light0_soft
		col_bg = gruvbox.dark0_soft
	end
	M.gruvbox = {
		bg = col_bg,
		fg = col_fg,
		pink = gruvbox.bright_red,
		green = gruvbox.neutral_green,
		cyan = gruvbox.neutral_aqua,
		yellow = gruvbox.neutral_yellow,
		orange = gruvbox.neutral_orange,
		red = gruvbox.neutral_red,
	}
end

local ok, ayu = pcall(require, "ayu.colors")
if not ok then
	return
else
	ayu.generate()
	M.ayu = {
		bg = ayu.panel_bg,
		fg = ayu.fg,
		pink = ayu.error,
		green = ayu.string,
		cyan = ayu.constant,
		yellow = ayu.accent,
		orange = ayu.keyword,
		red = ayu.markup,
	}
end

-- solarized
M.solarized_light = {
	bg = "#eee8d5", -- alt #eee8d5 | #fdf6e3
	fg = "#657b83",
	pink = "#073642",
	green = "#7d8d09",
	cyan = "#7d8d09",
	yellow = "#6c71c4",
	orange = "#cb4b16",
	red = "#dc322f",
}

M.feline = M[colorscheme]

return M
