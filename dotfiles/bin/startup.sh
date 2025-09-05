#!/bin/sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/personal-desktop
ssh-add ~/.ssh/school-desktop
