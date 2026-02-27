-- vim:fileencoding=utf-8:foldmethod=marker
--         ___                                               ___
--        /\_ \                     __                      /\_ \
--   _____\//\ \    __  __     __  /\_\     ___      ____   \//\ \    __  __     __
--  /\ '__`\\ \ \  /\ \/\ \  /'_ `\\/\ \  /' _ `\   /',__\    \ \ \  /\ \/\ \  /'__`\
--  \ \ \L\ \\_\ \_\ \ \_\ \/\ \L\ \\ \ \ /\ \/\ \ /\__, `\ __ \_\ \_\ \ \_\ \/\ \L\.\_
--   \ \ ,__//\____\\ \____/\ \____ \\ \_\\ \_\ \_\\/\____//\_\/\____\\ \____/\ \__/.\_\
--    \ \ \/ \/____/ \/___/  \/___L\ \\/_/ \/_/\/_/ \/___/ \/_/\/____/ \/___/  \/__/\/_/
--     \ \_\                   /\____/
--      \/_/                   \_/__/
-- -----------------------------------------------------------------------------------
-- Plugins.lua to load all those nice and cool stuff that makes neovim niice ---------
-- -----------------------------------------------------------------------------------

return {
	--: {{{ ONE LINERS
	--Devicons
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	--Lualine
	{ "nvim-lualine/lualine.nvim" },
	--yuck.vim
	--to human read the .yuck files (used by eww)
	{ "elkowar/yuck.vim" },
	--: }}}
	--NvimTree --------------------------------(<leader>ft)-
	--: {{{
	{
		"nvim-tree/nvim-tree.lua",
		--<space> + <f><t> toggles tree
		keys = {
			{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
		},
		opts = {},
		lazy = true,
	},
	--: }}}
	--CONFORM ---------------------------------(<leader>lf)-
	--: {{{
	{
		"stevearc/conform.nvim",
		opts = {
			-- Configure formatters by filetype
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				jsonc = { "prettier" },
				lua = { "stylua" },
				css = { "prettier" },
				scss = { "prettier" },
			},
			-- Define the custom command for deno_fmt
			-- Optional: set up format-on-save
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		-- Optional: add a keymap to manually trigger format
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format()
				end,
				desc = "Format file",
			},
		},
	},
	--: }}}
	--RANGER ----------------------------------(<leader>fr)-
	--: {{{
	{
		"kelly-lin/ranger.nvim",
		keys = {
			{ "<leader>fr", "<cmd>Ranger<cr>", desc = "Ranger" },
		},
		opts = { enable_cmds = true },
	},
	--: }}}
	-- BETTER TERM ----------------------------(<leader>, && <leader>.)-
	--: {{{
	{
		"CRAG666/betterTerm.nvim",
		keys = {
			{
				mode = { "n", "t" },
				"<C-,>",
				function()
					require("betterTerm").open()
				end,
				desc = "Open BetterTerm 0",
			},
			{
				mode = { "n", "t" },
				"<C-.>",
				function()
					require("betterTerm").open(1)
				end,
				desc = "Open BetterTerm 1",
			},
			{
				"<leader>tt",
				function()
					require("betterTerm").select()
				end,
				desc = "Select terminal",
			},
		},
		opts = {
			position = "bot",
			size = 4,
			jump_tab_mapping = "<A-$tab>",
		},
	},
	--: }}}
	--DOOING ----------------------------------(<leader>td)-
	--: {{{
	{
		"atiladefreitas/dooing",
		config = function()
			require("dooing").setup({
				-- your custom config here (optional)
			})
		end,
	},
	--: }}}
	--NvimColorizer ---------------------------
	--: {{{
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
	},
	--: }}}
} --RETURN final
--------------------------------------------------------------------------------------------------------------------
------------------------------- [UNDER TESTING/SETUP NOT CLEAR]-----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--Vim-visual-multi
--{
--	"mg979/vim-visual-multi",
--	lazy = true,
--},
