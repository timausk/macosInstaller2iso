#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# macosInstaller2iso.sh
#
# Creates a bootable ISO for VirtualBox from a
# Mac App Store macOS installer
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo "Creates a bootable ISO from macOS installer"

# Ask for the administrator password upfront.
sudo -v &> /dev/null
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &> /dev/null &

osVersion=false
PS3="Choose a macOS Version (Q Quit) "
options=("Monterey" "High Sierra")
select opt in "${options[@]}"; do
    case "$REPLY" in
    1) osVersion="${opt}"; break;;
    2) osVersion="${opt}"; break;;
    Q) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done

if [ "$osVersion" == false ]; then
    exit;
fi

echo "You choose $osVersion"

case $osVersion in
  "Monterey")
    flashDriveSize=14G
    ;;

  "High Sierra")
    flashDriveSize=8G
    ;;
  *)
    flashDriveSize=10G
    ;;
esac

# options
echo "press enter to use defaults"

read -p "Destination Directory [~/Desktop]: " opt1

[[ $opt1 = "" ]] && destDir="$HOME/Desktop" || destDir=$opt1

# check if path exist (expand if tilde is used in user input)
if [ ! -d "${destDir/#\~/$HOME}" ]; then
  echo -e "Directory [$opt1] does not exit, try again!";
  exit;
fi

echo "Generate bootable image";

# check if installer exist in Application folder
if [ ! -d /Applications/Install\ macOS\ "$osVersion".app ]; then
    echo "MacOS Installer not found in Application folder. Download Installer via App Store and try again"
    exit;
fi

# create virtual USB flash drive
hdiutil create -o /tmp/"$osVersion" -size "$flashDriveSize" -layout SPUD -fs HFS+J -type SPARSE

# mount flash drive
hdiutil attach /tmp/"$osVersion".sparseimage -noverify -mountpoint /Volumes/install_build

# put installer file into flash drive
sudo /Applications/Install\ macOS\ "$osVersion".app/Contents/Resources/createinstallmedia --volume /Volumes/install_build

# unmount
hdiutil detach /Volumes/Install\ macOS\ "$osVersion"/

# convert into iso file
hdiutil convert /tmp/"$osVersion".sparseimage -format UDTO -o /tmp/"$osVersion".iso

# mv to desktop folder
mv /tmp/"$osVersion".iso.cdr ~/Desktop/"$osVersion".iso

# delete sparseimage
rm /tmp/"$osVersion".sparseimage
