#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# macosInstaller2iso.sh
#
# Creates a bootable ISO for VirtualBox from a
# Mac App Store macOS installer
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ask for the administrator password upfront.
sudo -v &> /dev/null
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &> /dev/null &

echo "Create a bootable ISO from a App Store macOS installer"

# options
echo "press enter to use defaults"

read -p "Destination Diretory [~/Desktop]: " opt1

[[ $opt1 = "" ]] && destDir="~/Desktop" || destDir=$opt1

# check if path exist (expand if tilde is used in user input)
if [ ! -d "${destDir/#\~/$HOME}" ]; then
  echo -e "Directory [$opt1] does not exit, try again!";
  exit;
fi

echo "Generate bootable image";

# create virtual USB flash drive
hdiutil create -o /tmp/HighSierra -size 8G -layout SPUD -fs HFS+J -type SPARSE

# moaunt flash drive
hdiutil attach /tmp/HighSierra.sparseimage -noverify -mountpoint /Volumes/install_build

# put installer file into flash drive
sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build

# unmount
hdiutil detach /Volumes/Install\ macOS\ High\ Sierra/

# convert into iso file
hdiutil convert /tmp/HighSierra.sparseimage -format UDTO -o /tmp/HighSierra.iso

# mv to desktop folder
mv /tmp/HighSierra.iso.cdr ~/Desktop/HighSierra.iso

# delete sparseimage
rm /tmp/HighSierra.sparseimage
