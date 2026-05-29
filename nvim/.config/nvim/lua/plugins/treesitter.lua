return {
	"nvim-treesitter/nvim-treesitter",
	version = "v0.9.3",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "kotlin" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
