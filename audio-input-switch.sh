#!/usr/bin/env bash

## Author  : Jonathan Sharpe
## Github  : @jonathansharpe
#
## Applets : Change Audio Output Device

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Volume Info
prompt='Audio Inputs'
mesg='Switch Audio Inputs'

source_list=$(pactl list short sources)
source_long_list=$(pactl list sources)

mapfile -t source_numbers < <(echo "$source_list" | awk '{print $1}')
mapfile -t source_descriptions < <(echo "$source_long_list" | awk -F 'Description: ' '/Description:/{print $2}')

if [ "${#source_numbers[@]}" -ne "${#source_descriptions[@]}" ]; then
	echo "Error: source numbers and descriptions do not match."
	exit 1
fi

longest_string=""

for ((i = 0; i < ${#source_numbers[@]}; i++)); do
	options+=("${source_descriptions[i]}")
	string_length="$(echo -n "$source_descriptions[i]" | wc -m)"
	if [ "$string_length" -gt "$(echo -n "$longest_string" | wc -m)" ]; then
		longest_string="{$source_descriptions[i]}"
	fi
done

longest_string_length="$(echo -n "$longest_string" | wc -m)"

rofi_cmd() {
	rofi \
		-theme-str "window {width: $((longest_string_length*24))px;}" \
		-theme-str "listview {columns: 1; lines: ${#source_numbers[@]};}" \
		-dmenu \
		-i \
		-p "$prompt" \
		-mesg "$mesg" \
		-theme ${theme}
}

selected_description=$(printf "%s\n" "${options[@]}" | rofi_cmd | cut -f1)

if [ -n "$selected_description" ]; then
	selected_source_number=""
	for ((i = 0; i < ${#source_descriptions[@]}; i++)); do
		if [ "${source_descriptions[i]}" == "$selected_description" ]; then
			selected_source_number="${source_numbers[i]}"
			break
		fi
	done
	if [ -n "$selected_source_number" ]; then
		pactl set-default-source $selected_source_number
	else
		echo "Selected description not found; exiting."
	fi
else
	echo "No source selected; exiting."
fi
