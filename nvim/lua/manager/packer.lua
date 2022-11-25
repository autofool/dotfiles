-- Bootstrap packer.nvim

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})

		vim.api.nvim_cmd({ cmd = "packadd", args = { "packer.nvim" } }, {})
		return true
	end
	return false
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- Lint, formatting, code completion
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- coq
	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use({ "ms-jpq/coq.thirdparty", branch = "3p" })

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- Autopair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- Debugging
	use("mfussenegger/nvim-dap")

	-- Statusline
	use({
		"feline-nvim/feline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Explorer
	use("kyazdani42/nvim-tree.lua")

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Workspaces
	use({
		"natecraddock/workspaces.nvim",
	})

	-- Tagbar
	use("preservim/tagbar")

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Colorschemes
	use({
		"shaunsingh/solarized.nvim",
		as = "solarized_light",
	})

	use({
		"shatur/neovim-ayu",
	})

	use({
		"ellisonleao/gruvbox.nvim",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
