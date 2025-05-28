-- nvim/after/plugin/lsp.lua

-- Ensure that Neodev is set up before LSP configurations
require('neodev').setup()

local on_attach = function(_, bufnr)

	local bufmap = function(keys, func)
		vim.keymap.set('n', keys, func, { buffer = bufnr })
	end

	-- Basic LSP keymaps
	bufmap('<leader>r', vim.lsp.buf.rename)
	bufmap('<leader>a', vim.lsp.buf.code_action)
	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)
	bufmap('K', vim.lsp.buf.hover)

	-- ✅ Fix: Only use Telescope if it's installed
	local status, telescope_builtin = pcall(require, "telescope.builtin")
	if status then
		bufmap('gr', telescope_builtin.lsp_references)
		bufmap('<leader>s', telescope_builtin.lsp_document_symbols)
		bufmap('<leader>S', telescope_builtin.lsp_dynamic_workspace_symbols)
	end

	-- Format command
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end

-- Set LSP capabilities for autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup Mason and LSP handlers
require("mason").setup()
require("mason-lspconfig").setup_handlers({

	function(server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities
		}
	end,

	["lua_ls"] = function()
		require('lspconfig').lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {  -- ✅ Fix: Use correct `settings` field
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}
	end
})
