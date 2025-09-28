--    ___                                    ___                        
--   /\_ \                                  /\_ \                       
--   \//\ \       __     ____    __  __     \//\ \    __  __     __     
--     \ \ \    /'__`\  /\_ ,`\ /\ \/\ \      \ \ \  /\ \/\ \  /'__`\   
--      \_\ \_ /\ \L\.\_\/_/  /_\ \ \_\ \   __ \_\ \_\ \ \_\ \/\ \L\.\_ 
--     /\_____\\ \__/.\_\ /\____\\/`____ \ /\_\/\____\\ \____/\ \__/.\_\
--     \/_____/ \/__/\/_/ \/____/ `/___/> \\/_/\/____/ \/___/  \/__/\/_/
--                                   /\___/                             
--                                   \/__/
-- 
-- -------------------------------------------------------------------------------------------------------------------
-- THIS IS THE lazy.lua FILE CONFIG FOR THE   S I D O N I A   PROJECT, IT GETS THE LAZY.NVIM PLUGIN MANAGER WORKING --
-- AND SETS MOST OF THE IMPORTANT CONFIGS TO MAKE NVIM MORE LIKE THE EDITOR I NEED                                  --
-- -------------------------------------------------------------------------------------------------------------------

---- Bootstrap lazy.nvim --------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{out, "WarningMsg" },
			{"\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)



-- ------------------------------------------------------------------------------------------------
-- GENERAL VIM CONFIGURATION ----------------------------------------------------------------------
vim.g.mapleader = " "
vim.gmaplocalleader = "\\"

vim.cmd([[set whichwrap+=<,>,h,l]])--this enables line jumping using h or l at end of line
vim.wo.wrap = false -- <- THIS WORKS
vim.go.splitright = true
vim.go.cmdheight = 0 -- <-THIS WORKS!
vim.wo.cursorline = true

vim.go.shiftwidth = 3
vim.go.softtabstop = 3
vim.go.tabstop = 3

vim.wo.number = true
vim.wo.numberwidth = 4
-- -------------------------------------------------------------------------( end of VIM config )--
-- ------------------------------------------------------------------------------------------------

-- CONFIGURING VIM FOR VIMTEX epic if u ask me
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.UltiSnipsExpandTrigger='<tab>'
vim.g.UltiSnipsJumpForwardTrigger='<c-b>'
vim.g.UltiSnipsJumpBackwardTrigger='<c-z>'

-- lazy.nvim configuration ------------------------------------------------------------------------
require("lazy").setup({
	spec = {
		-- import plugins, go to lua/plugins/ to manage all plugins
		{ import = "plugins" },
	-- ---------------------
	-- Colorscheme ------ --
	-- ---------------------
	{
        --HERE I LOAD THE COLORCHEME, since it is essential for
        --the looks and feels
		"cocopon/iceberg.vim",
		lazy = false,
		priority = 1000,

		config = function ()
			vim.cmd([[colorscheme iceberg]])
		end,
	},


	},
	checker = { enabled = true },
	rocks = { enabled = false },
})

