#!/bin/sh
set -e
_basedir="$(dirname "$(readlink -f "${0}")")"
cd "$_basedir"
(command -v fakeroot >/dev/null 2>&1 && command -v dh_builddeb >/dev/null 2>&1 && command -v find >/dev/null 2>&1 || _missingdep=true)
case $_missingdep in
	true)
		printf "You either miss fakeroot, debhelper or find! Aborting!\n"
		exit 1
	;;
esac
fakeroot debian/rules binary
printf "done\n"
