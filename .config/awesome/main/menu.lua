local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local vars = require("main.user-variables")

local beautiful = require("beautiful")

mainmenu = awful.menu {
	items = {
		{"Hotkeys", function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end },
		{"Manual", vars.terminal.." start -- man awesome"},
		{"Edit Config", vars.terminal.." start -- "..vars.editor.." "..awesome.conffile},
		{"File Manager", vars.fileManager},
		{"Terminal", vars.terminal},
		{"Browser", vars.browser},
		{"Restart", awesome.restart},
	}
}
launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
    menu = mainmenu
})
