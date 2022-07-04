# Install

Guide to install the **Debian** version of the project.

Install [**VirtualBox v6.1**](https://www.virtualbox.org/wiki/Downloads).

Download the [**Debian**](https://www.debian.org/download) image.

## Virtual Machine Settings

Launch **VirtualBox** and follow the create wizard:

1.  Create a new Virtual Machine
2.  Name: **Born2beRoot** \
    Type: **Linux** \
    Version: **Debian (64-bit)**
3.  1GB RAM (or more)
4.  Choose **Create Virtual Hard Disk**
5.  Choose **VDI**
6.  Choose **Dynamically allocated**
7.  8GB HD

Additional configuration via **Settings**:

1.  Select the **Storage** tab
2.  Select the IDE Controller Empty disk
3.  Select the CD icon and pick the Debian Image file `debian-xx-x-x-amd64-netinst.iso`

## Debian Installation

Run the virtual machine and follow the OS install wizard.

1.  `Install` (Not `Graphical install`)
2.  Select Language and Locations and keyboard layout
3.  Hostname: **harndt42** \
    Domain name: **N/A** \
    Root password: ... \
    Re-enter: ... \
    Full name: **Humberto Arndt** \
    Username: **harndt** \
    Password: ... \
    Time zone: ...

### Partition setup

1.  Partition method: **Use entire disk and configure LVM (Encryoted)**
2.  Select disk
3.  Select partition **home**
4.  Yes
9.  Encryption passphras
6.  Define **max** as size to be used
7.  Write the changes to disk and configure encrypted volumes? **Yes** \
    Create encrypted volumes \
    `/dev/sda5` \
    Finish \
    Really erase the data? **Yes** 
13. Finish partitioning and write changes to disk? **Yes**

### Final Steps

- Scan another CD or DVD? **NO**
- Debian archive mirror country: **Brazil**
- `deb.debian.org`
- Leave proxy info field empty.
- Participate in the package usage survey? **NO**
- Unselect SSH server & standart system utilities
- GRUB **YES**
- Device for boot loader installation: `/dev/sda`
