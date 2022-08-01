---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local sharpe_path = "~/.config/awesome/themes/sharpe-theme/"

local theme = {}

theme.font          = "Dosis Medium 11"

-- TITLEBAR
--
theme.taglist_bg_focus = "#8aadf4"
theme.taglist_bg_urgent = "#ff0000"
theme.taglist_bg_occupied = "#000000"
theme.taglist_shape_border_color_focus = "#24273a"
theme.taglist_shape_border_color = "#8aadf4"
theme.taglist_shape_border_width = 2
theme.taglist_shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 5)
end
-- theme.taglist_bg_empty = "#000000"		-- uncomment if all tags are shown
-- theme.taglist_bg_volatile = "#000000"	-- no idea what this means
theme.taglist_fg_focus = "#24273a"
theme.taglist_fg_urgent = "#000000"
theme.taglist_fg_occupied = "#8aadf4"
-- theme.taglist_fg_empty = "#000000"		-- uncomment if all tags are shown
-- theme.taglist_fg_volatile = "#000000"	-- no idea what this means

theme.tasklist_bg_normal = "#000000"
theme.tasklist_bg_urgent = "#ff0000"
theme.tasklist_bg_focus = "#8aadf4"
theme.tasklist_fg_normal = "#ffffff"
theme.tasklist_fg_urgent = "#8aadf4"
theme.tasklist_fg_focus = "#24273a"
theme.tasklist_shape_border_color_focus = "#24273a"
theme.tasklist_shape_border_color = "#8aadf4"
theme.tasklist_shape_border_width = 2
theme.tasklist_shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 5)
end
theme.tasklist_fg_minimize = "#ffffff"
theme.tasklist_bg_minimize = "#444444"

theme.titlebar_bg_normal = "#000000"
theme.titlebar_bg_focus = "#24273a"
theme.titlebar_fg_normal = "#8aadf4"
theme.titlebar_fg_focus = "#8aadf4"

theme.bg_normal     = "#24273a"
theme.bg_focus      = "#777777"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = 0
theme.border_width  = dpi(2)
theme.border_normal = "#000000"
theme.border_focus  = "#8AADF4"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:

-- Generate taglist squares:
local taglist_square_size = dpi(8)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.taglist_fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.taglist_fg_occupied
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = sharpe_path.."titlebar/close.svg"
theme.titlebar_close_button_focus  = sharpe_path.."titlebar/close.svg"
theme.titlebar_close_button_focus_hover  = sharpe_path.."titlebar/close-hover.svg"

theme.titlebar_minimize_button_normal = sharpe_path.."titlebar/minimize.svg"
theme.titlebar_minimize_button_focus_hover = sharpe_path.."titlebar/minimize-hover.svg"
theme.titlebar_minimize_button_focus  = sharpe_path.."titlebar/minimize.svg"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = sharpe_path.."titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_inactive  = sharpe_path.."titlebar/maximize.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = sharpe_path.."titlebar/maximize-hover.svg"
theme.titlebar_maximized_button_normal_active = sharpe_path.."titlebar/restore.svg"
theme.titlebar_maximized_button_focus_active  = sharpe_path.."titlebar/restore.svg"

theme.wallpaper = sharpe_path.."images/nephrite-light.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
