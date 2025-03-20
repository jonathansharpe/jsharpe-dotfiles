#!/bin/bash
sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist
