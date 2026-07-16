return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "jdtls" },
				automatic_enable = {
					exclude = { "java_language_server" },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })

			local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
			local lombok_jar = mason_packages .. "/jdtls/lombok.jar"
			vim.lsp.config("jdtls", {
				cmd = { "jdtls", "--jvm-arg=-javaagent:" .. lombok_jar },
			})

			vim.lsp.enable({ "lua_ls", "ts_ls", "kotlin_language_server", "jdtls" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
