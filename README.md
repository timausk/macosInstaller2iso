# macosInstaller2iso

Shell Script to create a macOS install ISO file for VirtualBox

## Create ISO
* [Download](https://apps.apple.com/us/app/macos-ventura/id1638787999) macOS from App Store
* Download script and run `./macosInstaller2iso.sh`
* Follow instructions
* :information_source: Links to Apple SUS and different OS Versions can be found @ [mrmacintosh.com](https://mrmacintosh.com/how-to-download-macos-catalina-mojave-or-high-sierra-full-installers/)

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
    * The installation starts and after a while, the machine will reboot
    * __(!) After the reboot, the VM will display the following error message: Boot Failed. Mac OS X__
    * At this point, we need the VirtualBox boot manager to select the correct EFI
    * Restart the machine either with CMD+R (hard reset) or if Installer is already running
      by clicking on the Apple icon and choose "Restart"
    * __Now be quick:__ While the VM restarts, press fn+F12 to get into the VirtualBox boot manager
        * Go to Boot Maintenance Manager => Boot from File => select the PCIRoot which contains ...HD(2,GPT)... =>
          macOS Install Data => Locked Files => Boot Files => __select boot.efi__ 
          (_this will continue the installation_)
    * Click through the steps of the wizard
    * DONE

(!) **If the installation is complete, shut the VM down and create a snapshot.
It's always nice to have a backup of a fresh installation**

## Troubleshooting
###
* **MacOS Installer not found in Application folder.**
    * Check if correct macOS version is available in Application folder
    * Downloaded macOS Versions from App Store should be automatically mounted in the Application folder
    * Downloaded installer from Apple SUS, have to run in advance
### Installation
* **VirtualBox disk is not shown in Disk Utilities**
    * Click on "View" in the top left corner of the Disk Utility window and choose "Show All Devices"
* **After installation the VM boots into the installer again**
    * VirtualBox may not be ejected the installer, so remove installer in _Settings -> Storage_
