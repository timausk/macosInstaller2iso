This guide will provide instructions on how to properly configure VirtualBox 5 with macOS High Sierra.
It is important to note that for version ranges between vBox 5 and 7, and macOS High Sierra and Ventura, you may need to make certain adjustments to the properties in order to ensure proper functionality.

* [Guide for vBox7 and Ventura](vBox7-ventura.md)  

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

> **_NOTE:_** If the installation is complete, shut the VM down and create a snapshot.
It's always nice to have a backup of a fresh installation

