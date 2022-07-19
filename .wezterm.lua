local wezterm = require 'wezterm'

return {
	default_prog = {"/usr/bin/zsh", "-l"},
	color_scheme = "Abernathy",
	window_background_opacity = .85,
	font_size = 10.0,
	window_frame = {
		font = wezterm.font({family="Inter", weight="Medium"}),
		font_size = 10.0,
	}
}
