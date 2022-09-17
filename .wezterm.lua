local wezterm = require 'wezterm'

return {
	font = wezterm.font_with_fallback({'CartographCF','FantasqueSansMono Nerd Font Mono','JoyPixels'}, {weight = 'Medium'}),
	default_prog = {"/usr/bin/zsh", "-l"},
	color_scheme = "Abernathy",
	window_background_opacity = .85,
	font_size = 10.0,
	window_frame = {
		font = wezterm.font({family="Manrope", weight="Medium"}),
		font_size = 10.0,
	},
	warn_about_missing_glyphs = false,
}
