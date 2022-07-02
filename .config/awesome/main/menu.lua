local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local vars = require("main.user-variables")

local beautiful = require("beautiful")

local M = {} -- menu
local _M = {} -- module

local terminal = vars.terminal
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
	{"hotkeys", function()
		hotkeys_popup.show_help(nil, awful.screen.focused())
	end },
	{"manual", terminal .. "-e man awesome"},
	{"edit config", editor_cmd .. " " .. awesome.conffile},
	{"Terminal", terminal},
	{"restart", awesome.restart},
	{"quit", function() awesome.quit() end}
}

function _M.get()

	local menu_items = {
		{"awesome", M.awesome, beautiful.awesome_subicon},
		{"open terminal", terminal}
	}

	return menu_items
end
