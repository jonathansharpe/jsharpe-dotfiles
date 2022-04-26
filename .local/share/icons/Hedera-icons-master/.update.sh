#!/bin/sh
set -e
_basedir="$(dirname "$(readlink -f "${0}")")"
cd "$_basedir"
#rm -rf .git
#git init
git add .
LANG=C
MESSAGE="$(date -u '+%Y%m%d%H%M%S')"
git commit -m "$MESSAGE"
#git remote add origin http://gitlab.com/sixsixfive/Hedera-icons.git
#git push -u --force origin master
git push origin master
printf "\n...done\n"
exit 0
