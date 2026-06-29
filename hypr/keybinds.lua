--##################
--## KEYBINDINGS ###
--##################

-- Set programs that you use
local terminal = "kitty"
--$fileManager = dolphin
--local menu = "wofi"
local browser = "zen-browser"
--}}}

-- See https://wiki.hyprland.org/Configuring/Keywords/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
--hl.bind(mainMod .. " + C", killactive) DEPRECATED
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill wofi || wofi --show drun"), { release = true })
hl.bind(mainMod .. " + P", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty ranger")) -- SHOULD CHECK IF WORKS
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("filezilla"))
--hl.bind(mainMod .. J, togglesplit, # dwindle
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("command flameshot gui"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("command hyprpicker -a -f hex"))
-- Move focus with mainMod + vi move keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch to a submap called `resize`.
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)
-- Keybinds further down will be global again...

hl.bind(mainMod .. "+ left", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. "+ right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. "+ up", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. "+ down", hl.dsp.window.move({ direction = "down", group_aware = true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + TAB
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- APP LAUNCH screenshot tool
