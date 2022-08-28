-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
local bling = require("bling")
-- Notification library
local naughty = require("naughty")
package.loaded["naughty.dbus"] = {}
local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- START OF IMPORTING SHARPE MODULES
local capslock = require("awesomewm-capslock-widget")
require("main.error-handling")
beautiful.init("~/.config/awesome/themes/sharpe-theme/theme.lua")
local vars = require("main.user-variables")
local layouts = require("main.layouts")
local tags = require("main.tags")
local menu = require("main.menu")
local rules = require("main.rules")
local bindings = require("bindings.bindings")
local widgets = require("main.widgets")

gears.wallpaper.centered(beautiful.wallpaper, s, "#000000", 2)

awful.keyboard.append_global_keybindings({
	awful.key ({
		modifiers   = { modkey },
		keygroup    = "numrow",
		description = "only view tag",
		group       = "tag",
		on_press    = function (index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
})

-- SHARPE WIDGETS
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local weather_widget = require("awesome-wm-widgets.weather-widget.weather")
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.


-- -- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock('%a %b %e, %I:%M %p')

-- CALENDAR WIDGET
local cw = calendar_widget({
	placement = 'bottom_right',
	start_sunday = true,
	radius = 5,
})
mytextclock:connect_signal("button::press",
	function(_, _, _, button)
		if button == 1 then cw.toggle() end
	end
)


bling.widget.window_switcher.enable {
	type = "thumbnail",
	previous_key = "Right",
	next_key = "Left",
	vim_previous_key = "l",
	vim_next_key = "h",
}
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
		layout = {
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					id = 'text_role',
					widget = wibox.widget.textbox,
					align = "center",
				},
				left = 15,
				right = 15,
				widget = wibox.container.margin,
			},
			id = 'background_role',
			widget = wibox.container.background,
		},
        buttons = taglist_buttons,
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
		layout = {
			spacing = 2,
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					{
						{
							id     = 'clienticon',
							widget = awful.widget.clienticon,
							halign = 'center',
							valign = 'center',
						},
						widget  = wibox.container.margin,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				margins = 5,
				widget = wibox.container.margin,
			},
			forced_width = 48,
			forced_height = 48,
			id = 'background_role',
			widget = wibox.container.background,
		},
    }

    -- Create the wibox
    s.mywibox = awful.wibar(
		{
			position = "bottom",
			screen = s,
			height = 48,
			-- opacity = .75,
		}
	)

    -- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
		layout = wibox.layout.fixed.horizontal,
		launcher,
		{
			{
				color = beautiful.taglist_bg_empty,
				widget = wibox.container.margin(s.mytaglist),
				margins = 5,
			},
			widget = wibox.container.background,
			bg = beautiful.taglist_bg_empty,
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 10)
			end,
		},
		s.mypromptbox,
		{
			widget = wibox.container.margin,
			margins = 5,
		},
		{
			{
				color = beautiful.tasklist_bg_normal,
				widget = wibox.container.margin(s.mytasklist),
			},
			widget = wibox.container.background,
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 10)
			end,
		}
	},
	{ -- middle widgets
		widget = wibox.container.margin,
		margins = 0,
	},
	{ -- Right widgets
	layout = wibox.layout.fixed.horizontal,
	-- batteryarc_widget({
	-- 	show_current_level = true,
	-- 	arc_thickness = 1,
	-- 	size = 18,
	-- 	warning_msg_text = "Low battery!"
	-- }),
	volume_widget{
		mixer_cmd = "pavucontrol-qt",
		bg_color = "white",
		widget_type = "horizontal_bar",
		main_color = beautiful.tasklist_bg_focus,
		mute_color = beautiful.tasklist_bg_urgent,
		shape = 'rounded_rect',
		with_icon = true,
	},
	weather_widget({
		api_key='0a730da1dd8d10eb980eec4b9e4ae5e7',
		coordinates = {48.4718, -122.3259},
		time_format_12h = true,
		units = 'imperial',
		both_units_widget = false,
		icons = 'weather-underground-icons',
		icons_extension = '.png',
		show_hourly_forecast = true,
		show_daily_forecast = true,
	}),
	ram_widget({
		widget_height = 40,
		widget_width = 40,
	}),
	capslock,
	wibox.widget.systray(),
	net_speed_widget(),
	mytextclock,
	s.mylayoutbox,
},
	}
end)
client.connect_signal("manage", function(c)
	c.shape = function(cr,w,h)
		gears.shape.rounded_rect(cr,w,h,10)
	end
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

	local top_titlebar = awful.titlebar(c, {
		size = 40,
	})
    top_titlebar : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
			awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal,
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--
-- Autorun programs
autorun = true
autorunApps = {
	"picom --experimental-backends --backend glx",
	"NetworkManager",
	"xscreensaver",
	"pkill redshift",
	"dunst",
	"redshift-gtk",
	"fehbg",
	"wezterm start -- ~/bin/rclone-start.sh",
	"notify-send \"Awesome has loaded!\" "
}
if autorun then
	for app = 1, #autorunApps do
		awful.util.spawn(autorunApps[app])
	end
end
