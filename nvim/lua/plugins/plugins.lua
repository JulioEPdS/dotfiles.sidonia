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
	
    --Devicons
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	

    --NvimTree
	{ 
		"nvim-tree/nvim-tree.lua",
		--<space> + <f><t> toggles tree
		keys = {
			{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" }, 
		},
		opts = {},
		lazy = true,
	},

    --Lualine
	{
		'nvim-lualine/lualine.nvim',
	},
    --yuck.vim
    --to human read the .yuck files (used by eww)
    {
        "elkowar/yuck.vim",
		  --lazy = true,
    },

    --Vim-visual-multi
    { 
        "mg979/vim-visual-multi",
		  lazy = true,
    },

--    {
--        "stevearc/conform.nvim",
--        opts = {},
--    }
--
    --
    --ranger inside of nvim, kinda usefull, but ... limited, better sticking with nvim-tree
    {
          "kelly-lin/ranger.nvim",
            keys = {
                { "<leader>fr", "<cmd>Ranger<cr>", desc = "Ranger" }, 
            },
            opts = {enable_cmds=true},
    },

-- VIMTEX
    {
        'lervag/vimtex',
	lazy = false,
	-- tag = "v2.15", -- uncomment to pin to a specific release
    },
    
-- Ultisnips
    {
	    'SirVer/ultisnips',
	    lazy = false,
    },

    -- for Ultisnips , snipets plugin
    {
	    'honza/vim-snippets',
	    lazy = false,
    },

    {
	    --TERM PLUGIN
	      -- amongst your other plugins
	      {'akinsho/toggleterm.nvim', version = "*", config = true}
	      --     -- or
	      --       {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
    },


}
