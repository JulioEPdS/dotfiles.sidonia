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
-- Plugins.lua to load all those nice and cool stuff that makes neovim d' boss -------
-- -----------------------------------------------------------------------------------

return {
	--: {{{ NEEDED
	--Devicons------------------------------------------------------------------------
	--Provides Nerd Font icons (glyphs) for use by Neovim plugins
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	--Lualine------------------------------------------------------------------------
	--A blazing fast and easy to configure Neovim statusline written in Lua.
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				disabled_filetypes = {
					--To prevent the statusline showing on places where it shouldn't
					statusline = { "NvimTree", "better_term" },
				},
			},
		},
	},

	--Yuck
	--Vim filetype support for the new eww configuration language yuck.
	{ "elkowar/yuck.vim" },

	--Tidal
	--A Vim/NeoVim plugin for TidalCycles, the language for live coding musical patterns written in Haskell.
	--This plugin by default uses tmux, a known and loved terminal multiplexer, for communicating with between
	--Vim and the Tidal interpreter. It was originally based on vim-slime.
	{ "tidalcycles/vim-tidal" },

	--Bufferline
	--A snazzy buffer line (with tabpage integration) for Neovim built using lua.
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				mode = "tabs",
				themable = true,
				close_command = "bdelete! %d",
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_update_on_event = true,
				color_icons = true,
				show_buffer_close_icons = false,
				pick = { alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890" },
			},
		},
	},
	--: }}}
	-- Devicons, Lualine, Eww yuck, Tidal, Bufferline
	--: {{{ nvimTree
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
	-- ----------------------------------(<leader>ft)-
	--: {{{ nvimConform
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
	-- ----------------------------------(<leader>lf)-
	--: {{{ nvimRanger
	{
		"kelly-lin/ranger.nvim",
		keys = {
			{ "<leader>fr", "<cmd>Ranger<cr>", desc = "Ranger" },
		},
		opts = { enable_cmds = true },
	},
	--: }}}
	-- ----------------------------------(<leader>fr)-
	--: {{{ nvimBetterTerm
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
			-- pretty much unnecessary
			--{
			--	"<leader>tt",
			--	function()
			--		require("betterTerm").select()
			--	end,
			--	desc = "Select terminal",
			--},
		},
		opts = {
			position = "bot",
			size = 4,
			jump_tab_mapping = "<A-$tab>",
		},
	},
	--: }}}
	-- ----------------------------------(<C>, & <C>.)-
	--: {{{ nvimDooing
	{
		"atiladefreitas/dooing",
		config = function()
			require("dooing").setup({
				-- your custom config here (optional)
			})
		end,
	},
	--: }}}
	-- ----------------------------------(<leader>td)-
	--: {{{ nvimColorizer
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
			filetypes = {
				"*", -- Highlight all files, but customize some others.
				css = { rgb_fn = true, oklch_fn = true }, -- Enable parsing rgb(...) and oklch(...) functions in css.
				html = { names = true }, -- Disable parsing "names" like Blue or Gray
			},
		},
	},
	--: }}}
	-- --------------------------
} --RETURN final
--------------------------------------------------------------------------------------------------------------------
------------------------------- [UNDER TESTING/SETUP NOT CLEAR]-----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--Vim-visual-multi
--{
--	"mg979/vim-visual-multi",
--	lazy = true,
--},
