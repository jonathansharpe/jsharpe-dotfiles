#!/usr/bin/env bash

scrDir="/home/jonathan/HyDE/Configs/.local/lib/hyde/"
confDir="${confDir}/config"
# shellcheck source=/dev/null
. "${scrDir}/globalcontrol.sh"
rofiStyle="${rofiStyle:-1}"

if [[ "${rofiStyle}" =~ ^[0-9]+$ ]]; then
    rofi_config="style_${rofiStyle:-1}"
else
    rofi_config="${rofiStyle:-"style_1"}"
fi

rofi_config="${ROFI_LAUNCH_DRUN_STYLE:-$rofi_config}"

font_scale="${ROFI_LAUNCH_SCALE}"
[[ "${font_scale}" =~ ^[0-9]+$ ]] || font_scale=${ROFI_SCALE:-10}

rofi_args=(
	-dmenu
	-i
	-p "Audio Outputs"
	-mesg "Switch Audio Output"
	-show-icons
	-theme "${rofi_config}"
	)


#// set overrides
hypr_border="${hypr_border:-10}"
hypr_width="${hypr_width:-2}"
wind_border=$((hypr_border * 3))

if [[ -f "${HYDE_STATE_HOME}/fullscreen_${r_mode}" ]]; then
    hypr_width="0"
    wind_border="0"
fi

[ "${hypr_border}" -eq 0 ] && elem_border="10" || elem_border=$((hypr_border * 2))

mon_data=$(hyprctl -j monitors)
is_vertical=$(jq -e '.[] | select(.focused==true) | if (.transform % 2 == 0) then .width / .height else .height / .width end < 1' <<<"${mon_data}")

if [[ "$is_vertical" == "true" ]]; then
    echo "Monitor is vertical"
fi

r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} element {border-radius: ${elem_border}px;}"

# set font name
font_name=${ROFI_LAUNCH_FONT:-$ROFI_FONT}
font_name=${font_name:-$(get_hyprConf "MENU_FONT")}
font_name=${font_name:-$(get_hyprConf "FONT")}

# set rofi font override
font_override="* {font: \"${font_name:-"JetBrainsMono Nerd Font"} ${font_scale}\";}"

i_override="$(get_hyprConf "ICON_THEME")"
i_override="configuration {icon-theme: \"${i_override}\";}"

rofi_args+=(
    -theme-str "${font_override}"
    -theme-str "${i_override}"
    -theme-str "${r_override}"
    -theme "${rofi_config}"
)

# == Gather Sinks ==
sink_list=$(pactl list short sinks)
sink_long_list=$(pactl list sinks)

mapfile -t sink_numbers < <(echo "$sink_list" | awk '{print $1}')
mapfile -t sink_descriptions < <(echo "$sink_long_list" | awk -F 'Description: ' '/Description:/{print $2}')

# Get the default sink name (e.g., alsa_output.pci-...analog-stereo)
default_sink_name=$(pactl info | awk -F ': ' '/Default Sink: /{print $2}')
default_sink_index=$(echo "$sink_list" | awk -v name="$default_sink_name" '$2 == name {print $1}')

# Validate
if [ "${#sink_numbers[@]}" -ne "${#sink_descriptions[@]}" ]; then
    echo "Error: sink numbers and descriptions do not match."
    exit 1
fi

# Build Options
options=()
for ((i = 0; i < ${#sink_descriptions[@]}; i++)); do
    desc="${sink_descriptions[i]}"
	# icon="audio-card"
    if [ "${sink_numbers[i]}" == "$default_sink_index" ]; then
        desc="✔ $desc"
    fi
    # options+=($'\0'"${icon}"$'\0'"${desc}")
	options+=("$desc")
done

# Show Rofi Menu
selected_description=$(printf "%s\n" "${options[@]}" | rofi "${rofi_args[@]}")

selected_description="${selected_description#✔ }"

# Set Sink if Chosen
if [ -n "$selected_description" ]; then
    for ((i = 0; i < ${#sink_descriptions[@]}; i++)); do
        if [ "${sink_descriptions[i]}" == "$selected_description" ]; then
            new_sink="${sink_numbers[i]}"
            pactl set-default-sink "$new_sink"

            # Notification (requires dunst or similar)
            notify-send "Audio Output Switched" "$selected_description"
            break
        fi
    done
fi
