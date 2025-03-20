#!/usr/bin/env bash

## Author  : Jonathan Sharpe
## Github  : @jonathansharpe
#
## Applets : Change Audio Output Device

# Import Current Theme

# Volume Info
prompt='Audio Outputs'
mesg='Switch Audio Outputs'

sink_list=$(pactl list short sinks)
sink_long_list=$(pactl list sinks)

mapfile -t sink_numbers < <(echo "$sink_list" | awk '{print $1}')
mapfile -t sink_descriptions < <(echo "$sink_long_list" | awk -F 'Description: ' '/Description:/{print $2}')

if [ "${#sink_numbers[@]}" -ne "${#sink_descriptions[@]}" ]; then
	echo "Error: sink numbers and descriptions do not match."
	exit 1
fi

longest_string=""

for ((i = 0; i < ${#sink_numbers[@]}; i++)); do
	options+=("${sink_descriptions[i]}")
	string_length="$(echo -n "$sink_descriptions[i]" | wc -m)"
	if [ "$string_length" -gt "$(echo -n "$longest_string" | wc -m)" ]; then
		longest_string="{$sink_descriptions[i]}"
	fi
done

longest_string_length="$(echo -n "$longest_string" | wc -m)"

rofi_cmd() {
	rofi \
		-dmenu \
		-i \
		-p "$prompt" \
		-mesg "$mesg" \
}

selected_description=$(printf "%s\n" "${options[@]}" | rofi_cmd | cut -f1)

if [ -n "$selected_description" ]; then
	selected_sink_number=""
	for ((i = 0; i < ${#sink_descriptions[@]}; i++)); do
		if [ "${sink_descriptions[i]}" == "$selected_description" ]; then
			selected_sink_number="${sink_numbers[i]}"
			break
		fi
	done
	if [ -n "$selected_sink_number" ]; then
		pactl set-default-sink $selected_sink_number
	else
		echo "Selected description not found; exiting."
	fi
else
	echo "No sink selected; exiting."
fi
