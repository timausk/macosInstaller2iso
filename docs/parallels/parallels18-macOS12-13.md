1. Installation
   * Open Parallels and start "Installation Assistent"
   * On the "Create New" screen choose "Install Window or another OS" click continue 
   * Drag and drop or select the (Monterey / Ventura) image file
     * It shows "Unable to detect operating system", but no worries, just click continue 
   * Choose macOS from the popup dropdown 
   * Add a name for the machine and click create 
   * Select a language and continue 
   * Select "Install macOS (Monterey / Ventura)"
   * Agree license agreement 
   * Select the preferred language 
   * The installation starts and after a while, the machine will reboot 
   * Click through the steps of the Installation Guide


2. Configure the virtual machine
   * Hardware 
      * -> CPU & Memory
           * Processor 4
           * Memory: 8192MB
      * -> Graphics
        * Memory: 128MB
      * **on Ventura**
      * -> Network -> Advanced -> Type: Virtio network adapter
        * otherwise there is no shared network available on the guest


3. Install Parallel Tools
    * Make sure the installation disk is ejected
    * Actions -> Install Parallel Tools -> Continue
    * Click Parallels Tools Icon on Desktop
    * Click Install
    * Restart after the installation is complete


> **_NOTE:_** If the installation is complete, create a snapshot (Actions -> Take snapshot).
It's always nice to have a backup of a fresh installation

