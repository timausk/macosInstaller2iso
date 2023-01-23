# Virtual Box
* [VirtualBox 7 (Ventura)](virtualBox/vBox7-ventura.md) 
* [VirtualBox 5 (HighSierra)](virtualBox/vBox5-highSierra.md)


## Troubleshooting
### Installation
* **Failed to open session for the virtual machine [NAME] (NS_ERROR_FAILURE (0x80004005))**
    * On macOS < Ventura, upgrading the extension pack
    * On macOS Ventura, use VBox v7
* **VirtualBox disk is not shown in Disk Utilities**
    * Click on "View" in the top left corner of the Disk Utility window and choose "Show All Devices"
* **After installation the VM boots into the installer again**
    * VirtualBox may not be ejected the installer, so remove installer in _Settings -> Storage_

# Parallels
* [Parallels 18 (Monterey, Ventura)](parallels/parallels18-macOS12-13.md) 

## Troubleshooting
* **If machine won't boot up**
  * Action -> Stop -> wait until power off and turn machine on again
* **No network on guest**
  * on macOS Ventura select the Virtio network adapter
  * Hardware -> Network -> Advanced -> Type: Virtio network adapter

