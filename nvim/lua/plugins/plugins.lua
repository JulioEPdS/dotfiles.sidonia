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
--    {
--	    'SirVer/ultisnips',
--	    lazy = false,
--    },

    -- for Ultisnips , snipets plugin
--    {
--	    'honza/vim-snippets',
--	    lazy = false,
--    },

--  {
	    --TERM PLUGIN
--	      -- amongst your other plugins
--	      {'akinsho/toggleterm.nvim', version = "*", config = true}
--	      --     -- or
--	      --       {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
--    },


    {
	      "adalessa/laravel.nvim",
	        dependencies = {
			    "tpope/vim-dotenv",
			        "MunifTanjim/nui.nvim",
				    "nvim-lua/plenary.nvim",
				        "nvim-neotest/nvim-nio",
					    "ravitemer/mcphub.nvim", -- optional
					      },
					        cmd = { "Laravel" },
						  keys = {
							      { "<leader>ll", function() Laravel.pickers.laravel() end,              desc = "Laravel: Open Laravel Picker" },
							          { "<c-g>",      function() Laravel.commands.run("view:finder") end,    desc = "Laravel: Open View Finder" },
								      { "<leader>la", function() Laravel.pickers.artisan() end,              desc = "Laravel: Open Artisan Picker" },
								          { "<leader>lt", function() Laravel.commands.run("actions") end,        desc = "Laravel: Open Actions Picker" },
									      { "<leader>lr", function() Laravel.pickers.routes() end,               desc = "Laravel: Open Routes Picker" },
									          { "<leader>lh", function() Laravel.run("artisan docs") end,            desc = "Laravel: Open Documentation" },
										      { "<leader>lm", function() Laravel.pickers.make() end,                 desc = "Laravel: Open Make Picker" },
										          { "<leader>lc", function() Laravel.pickers.commands() end,             desc = "Laravel: Open Commands Picker" },
											      { "<leader>lo", function() Laravel.pickers.resources() end,            desc = "Laravel: Open Resources Picker" },
											          { "<leader>lp", function() Laravel.commands.run("command_center") end, desc = "Laravel: Open Command Center" },
												      {
													            "gf",
														          function()
																          local ok, res = pcall(function()
																		            if Laravel.app("gf").cursorOnResource() then
																				                return "<cmd>lua Laravel.commands.run('gf')<cr>"
																						          end
																							          end)
																								          if not ok or not res then
																										            return "gf"
																											            end
																												            return res
																													          end,
																														        expr = true,
																															      noremap = true,
																															          },
																																    },
																																      event = { "VeryLazy" },
																																        opts = {
																																		    lsp_server = "phpactor", -- "phpactor | intelephense"
																																		        features = {
																																				      pickers = {
																																					              provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
																																						            },
																																							        },
																																								  },
																																							  }

}
