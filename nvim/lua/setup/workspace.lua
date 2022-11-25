-- Setup workspaces

local ok, wrk = pcall(require, "workspaces")
if ok then
	wrk.setup({
		hooks = {
			open = {
				"NvimTreeOpen",
				"Telescope find_files",
			},
		},
	})
end
