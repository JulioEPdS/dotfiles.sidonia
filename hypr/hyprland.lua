-- vim:fileencoding=utf-8:foldmethod=marker
--                   __                                   __   __                                ___                           __
--           __     /\ \                    __           /\ \ /\ \                              /\_ \                         /\ \
--     ____ /\_\    \_\ \     ___     ___  /\_\      __  \ \ \\ \ \___    __  __   _____    _ __\//\ \       __       ___     \_\ \
--    /',__\\/\ \   /'_` \   / __`\ /' _ `\\/\ \   /'__`\ \ \ \\ \  _ `\ /\ \/\ \ /\ '__`\ /\`'__\\ \ \    /'__`\   /' _ `\   /'_` \
--   /\__, `\\ \ \ /\ \L\ \ /\ \L\ \/\ \/\ \\ \ \ /\ \L\.\_\ \ \\ \ \ \ \\ \ \_\ \\ \ \L\ \\ \ \/  \_\ \_ /\ \L\.\_ /\ \/\ \ /\ \L\ \
--   \/\____/ \ \_\\ \___,_\\ \____/\ \_\ \_\\ \_\\ \__/.\_\\ \ \\ \_\ \_\\/`____ \\ \ ,__/ \ \_\  /\____\\ \__/.\_\\ \_\ \_\\ \___,_\
--    \/___/   \/_/ \/__,_ / \/___/  \/_/\/_/ \/_/ \/__/\/_/ \ \ \\/_/\/_/ `/___/> \\ \ \/   \/_/  \/____/ \/__/\/_/ \/_/\/_/ \/__,_ /
--                                                            \ \_\           /\___/ \ \_\
--                                                             \/_/           \/__/   \/_/

-- Create your files separately and then link them to this file like this:

-- {{{ MONITORS
--###############
--## MONITORS ###
--###############

-- See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
--}}}

--################
--## AUTOSTART ###
--################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- exec-once = $terminal
-- exec-once = nm-applet &
-- exec-once = waybar & hyprpaper & firefox

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("eww open bar & nm-tray")
end)

--OLD SYNTAX
--exec-once = hyprpaper &
--exec-once = eww open bar &
--exec-once = nm-tray &

--#############################
--# ENVIRONMENT VARIABLES    ##
--#############################

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "phinger-cursors-light")

hl.env("QT_QPA_PLATFORMTHEME", "gtk3")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

--env = GTK_THEME,dark

-- {{{ LOOK AND FEEL
--#############################
--## LOOK AND FEEL           ##
--#############################

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 2,

		-- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		col = {
			active_border = "rgb(c6c8d1)", --rgb(91acd1) 50deg
			inactive_border = "rgb(161821)",
		},
		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
		--snap = true
	},

	-- https://wiki.hyprland.org/Configuring/Variables/#decoration
	decoration = {
		rounding = 0,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1,
		inactive_opacity = 0.94,

		shadow = {
			enabled = false,
			--range = 4,
			--render_power = 3,
			--color = rgba(1a1a1aee),
		},

		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 2,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	-- https://wiki.hyprland.org/Configuring/Variables/#animations
	animations = {
		enabled = true,
	},
})

-- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- workspace = w[tv1], gapsout:0, gapsin:0
-- workspace = f[1], gapsout:0, gapsin:0
-- windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
-- windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
-- windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
-- windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		--    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})
-- https://wiki.hyprland.org/Configuring/Variables/#misc
hl.config({
	misc = {
		--force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
		font_family = "VictorMonoNerdFontMono",
	},
})

hl.config({
	ecosystem = {
		no_donation_nag = true,
	},
})
--}}}

--{{{ Input
--#############################
--## INPUT                   ##
--#############################

-- https://wiki.hyprland.org/Configuring/Variables/#input
hl.config({
	input = {
		kb_layout = "latam",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures
--gestures {
--    workspace_swipe = false
--}

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.2,
})
--}}}

--#############################
--# KEYBINDING               ##
--#############################
require("keybinds")

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

--exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
