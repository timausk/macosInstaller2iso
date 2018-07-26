# macosInstaller2iso

Shell Script to create a macOS install ISO file for VirtualBox

## Create ISO
* [Download](https://itunes.apple.com/de/app/macos-high-sierra/id1246284741) macOS HightSierra from App Store
    * Hint: redownload Installer if downloaded before 5th of October. Apple made some changes to the previously released version, especially to the installer, which are important to get this VM running. The version of the "Install macOS High Sierra.app" has to be 13.0.66 or above.
* Download script and run `./macosInstaller2iso.sh`
* Follow instructions

## Create VM
_The following settings work well for my machines and use cases. Depending on your hardware,
you may want to change RAM, the share of CPU power the VM is allowed to use or other settings._
1. VM creation wizard
    * Name: [your choice]
    * Typ: MacOS
    * Version: Mac OS X (64-bit) or, if in your VirtualBox version available - macOS 10.13 High Sierra (64-bit)
    * Memory Size: 3072 - 4096MB
    * Hard disk type: VDI
    * Storage on physical hard disk: dynamically allocated
    * Hard disk size: 30GB+ (empty installation ~ 12GB, some OS updates need up to 17GB additional space)
2. Settings
    * _System -> Motherboard -> Boot Order_:  **untick Floppy**
    * _System -> Motherboard -> Processor_: **2 CPU / Execution Cap ~80%**
    * _Display -> ScreenVideo_: **128MB**
    * _Storage_: **<mark>Don't activate SSD</mark>**; select HighSierra.iso [Optical Drive ("Empty")]
    * _Audio_: **untick 'Enable Audio'** to prevent choppiness
3. Installation
    * Start new VM
    * select your preferred language
    * Go to `Disk Utility`
    * Select the VirtualBox disk and choose Erase to format it as a Mac OS Extended (Journaled) drive
    * When the erase process is done, close Disk Utility
    * Choose `Install macOS`
    * Agree license agreement
    * Choose the previously created virtual hard disk and click on "Install"

(!) **If the installation is complete, shut the VM down and create a snapshot.
It's always nice to have a backup of a fresh installation**

## Troubleshooting
### Installation
* **VirtualBox disk is not shown in Disk Utilities**
    * Click on "View" in the top left corner of the Disk Utility window and choose "Show All Devices"
* **After installation the VM boots into the installer again**
    * VirtualBox may not be ejected the installer, so remove installer in _Settings -> Storage_
