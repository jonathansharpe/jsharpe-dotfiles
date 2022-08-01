local wezterm = require 'wezterm'

return {
	font = wezterm.font('Iosevka Nerd Font Mono', {weight = 'Medium'}),
	default_prog = {"/usr/bin/zsh", "-l"},
	color_scheme = "Abernathy",
	window_background_opacity = .85,
	font_size = 10.0,
	window_frame = {
		font = wezterm.font({family="Dosis", weight="Medium"}),
		font_size = 10.0,
	}
}
