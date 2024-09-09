#!/bin/bash

# Update the system first (official repository packages)
paru --color=auto \
	--sudoloop \
	--newsonupgrade \
	--repo \
	--pgpfetch \
	--upgrademenu \
	--bottomup \
	--skipreview \
	--nodevel \
	--batchinstall \
	-Syu

# Get the list of AUR packages to update
aur_packages=$(paru -Qum | awk '{print $1}')

# Loop through each AUR package and try to update it
for package in $aur_packages; do
    echo "Updating $package..."
    paru -S --noconfirm "$package"
    if [ $? -ne 0 ]; then
        echo "Failed to update $package. Skipping..."
    fi
done

echo "All possible updates completed."

