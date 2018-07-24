# macosInstaller2iso

The script creates a macOS install ISO file for VirtualBox

## Create ISO
* [Download](https://itunes.apple.com/de/app/macos-high-sierra/id1246284741) macOS HightSierra from App Store
    * Hint : redownload Installer if downloaded before 5th of October. Apple made some changes to the previously released version, especially to the installer, which are important to get this VM running. The version of the "Install macOS High Sierra.app" has to be 13.0.66 or above.
* Download script and run `./macosInstaller2iso.sh`
* Follow instructions

## Create VM
1. VM creation wizard
    * Name: [your choice]
    * Typ: MacOS
    * Version: Mac OS X (64-bit) or, if in your VirtualBox version available - macOS 10.13 High Sierra (64-bit)
    * Memory Size: 3072 - 4096MB
    * Hard disk type: VDI
    * Storage on physical hard disk: dynamically allocated
    * Hard disk size: ~ 20-30GB (empty installation = 11,4 GB)
2. Settings
    * Boot Order: untick Floppy (System -> Motherboard -> Boot Order)
    * Processor: 2 CPU / Execution Cap ~80% (System -> Motherboard -> Processor)
    * Video: 128MB (Display -> Screen)
    * **Don't activate SSD**; select HighSierra.iso [Optical Drive ("Empty")] (Storage) 
    * untick 'Enable Audio' option to prevent choppiness (Audio)
3. Installation
    * Start new VM
    * select your preferred language
    * Go to `Disk Utility`
    * Click on "View" in the top left corner of the Disk Utility window and choose "Show All Devices"
    * Select the VirtualBox disk and choose Erase to format it as a Mac OS Extended (Journaled) drive
    * When the erase process is done, close Disk Utility
    * Choose `Install macOS`
    * Agree license agreement
    * Choose the previously created virtual hard disk and click on "Install"
    