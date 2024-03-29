# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

<!-- Format restrictions - see https://common-changelog.org and https://keepachangelog.com/ for details -->
<!-- Each Release must start with a line for the release version of exactly this format: ## [version] -->
<!-- The subsequent comment lines start with a space - not to irritate the release scripts parser!
 ## [yyyy.mm.dd]
 <empty line> - optional sub sections may follow like:
 ### Added:
 - This feature was added
 <empty line>
 ### Changed:
 - This feature was changed
 <empty line>
 ### Removed:
 - This feature was removed
 <empty line>
 ### Fixed:
 - This issue was fixed
 <empty line>
 <empty line> - next line is the starting of the previous release
 ## [yyyy.mm.dd]
 <empty line>
 <...>
 !!! In addition the compare URL links are to be maintained at the end of this CHANGELOG.md as follows.
     These links provide direct access to the GitHub compare vs. the previous release.
     The particular link of a released version will be copied to the release notes of a release accordingly.
     At the end of this file appropriate compare links have to be maintained for each release version in format:
 
  +-current release version
  |
  |            +-URL to this repo    previous release version tag-+            +-current release version tag
  |            |                                                  |            |
 [yyyy.mm.dd]: https://github.com/MHARMBIAN/build_actions/compare/vYYYY-MM-DD..vYYYY-MM-DD
-->
<!--
## [Unreleased]

### Added
- TBD

### Changed
- TBD

### Deprecated
- TBD

###	Removed
- TBD

### Fixed
- TBD

###	Security
- TBD
-->

## [Unreleased]

### Changed
- TBD


## [2023.03.30]

### Versions
- Armbian: v2023.03.30-wip [5463621](https://github.com/MHARMBIAN/armbian_build/commit/54636219cc877a93414e312997de59485392a589)
- U-Boot:  2022.07
- Kernel:  6.1.21
- Linux:   Ubuntu 22.04 LTS (Jammy Jellyfish)

### Features
- SUNXI NAND SPL loading
- Support MTD slc-mode partition for Hynix MLC NAND H27UCG8T2ATR-BC

### Userpatches
- U-Boot 2022.07:
  - Enable NAND SPL for the Cubietruck_defconfig
  - Added few SPL NAND boot loggings
  - nand command(s) working on nand0 device
- Kernel 6.1:
  - Overlay DTS for Cubietruck with NAND boot and a UBI partition with slc-mode
  - MTD driver: Add pairing scheme for Hynix MLC NAND H27UCG8T2ATR-BC
- SDCard Image:
  - add NAND SPL boot image and U-Boot with dtb image for flashing to NAND to<br>
    `/usr/lib/linux-u-boot-current-cubietruck_v2023.03.30-wip_armhf`
  - NAND can be erased and flashed with system booted from the SD card
  - Following NAND partitions are defined:<br>
    ```
    /dev/mtd0 SPL           - size: 2MB   offset: 0x0
    /dev/mtd1 SPL.backup    - size: 2MB   offset: 0x200000
    /dev/mtd2 U-Boot        - size: 2MB   offset: 0x400000
    /dev/mtd3 U-Boot.backup - size: 2MB   offset: 0x600000
    /dev/mtd4 env           - size: 2MB   offset: 0x800000
    /dev/mtd5 UBI           - size: 3,9GB offset: 0xA00000
    ```
    :warning: If `/dev/mtdN` device initialization fails on kernel startup due to too many bad blocks,
    then U-Boot has to be entered via serial line connected terminal. In U-Boot console
    either **`nand erase.chip`** or **`nand scrub.chip -y`** can be used to cleanup the corrupted NAND.<br>
    :point_right: The UBI partition is configured for SLC mode - otherwise the main line kernel will reject
    to use it by UBIFS. As a consequence this partition can use half the size of the MLC NAND only.
    For details refer to [Running UBI/UBIFS on MLC NAND](https://elinux.org/images/5/54/Weinberger.pdf).<br>
    <br>
  - The SPL and U-Boot images can be flashed to /dev/mtdX via the mtd-utils package tools:<br>
    ```
    sudo flash_erase /dev/mtd0 0 0
    sudo flash_erase /dev/mtd1 0 0
    sudo nandwrite -o -n /dev/mtd0 /boot/nand/sunxi-spl-with-ecc.bin
    sudo nandwrite -o -n /dev/mtd1 /boot/nand/sunxi-spl-with-ecc.bin
    sudo flash_erase /dev/mtd2 0 0
    sudo flash_erase /dev/mtd3 0 0
    sudo nandwrite -p /dev/mtd2 /boot/nand/u-boot-dtb.img
    sudo nandwrite -p /dev/mtd3 /boot/nand/u-boot-dtb.img
    ```
    Board will boot then without SD card .e.g. into a SATA rootfs


## [2023.03.29]

### Versions
- Armbian: v2023.03.29-wip [5463621](https://github.com/MHARMBIAN/armbian_build/commit/54636219cc877a93414e312997de59485392a589)
- U-Boot:  2022.07
- Kernel:  5.15.104
- Linux:   Ubuntu 22.04 LTS (Jammy Jellyfish)

### Features
- SUNXI NAND SPL loading
- Support MTD slc-mode partition for Hynix MLC NAND H27UCG8T2ATR-BC

### Userpatches
- U-Boot 2022.07:
  - Enable NAND SPL for the Cubietruck_defconfig
  - Added few SPL NAND boot loggings
  - nand command(s) working on nand0 device
- Kernel 5.15:
  - Overlay DTS for Cubietruck with NAND boot and a UBI partition with slc-mode
  - MTD driver: Add pairing scheme for Hynix MLC NAND H27UCG8T2ATR-BC
- SDCard Image:
  - add NAND SPL boot image and U-Boot with dtb image for flashing to NAND to<br>
    `/usr/lib/linux-u-boot-current-cubietruck_v2023.03.29-wip_armhf`
  - NAND can be erased and flashed with system booted from the SD card
  - Following NAND partitions are defined:<br>
    ```
    /dev/mtd0 SPL           - size: 2MB   offset: 0x0
    /dev/mtd1 SPL.backup    - size: 2MB   offset: 0x200000
    /dev/mtd2 U-Boot        - size: 2MB   offset: 0x400000
    /dev/mtd3 U-Boot.backup - size: 2MB   offset: 0x600000
    /dev/mtd4 env           - size: 2MB   offset: 0x800000
    /dev/mtd5 UBI           - size: 3,9GB offset: 0xA00000
    ```
    :warning: If `/dev/mtdN` device initialization fails on kernel startup due to too many bad blocks,
    then U-Boot has to be entered via serial line connected terminal. In U-Boot console
    either **`nand erase.chip`** or **`nand scrub.chip -y`** can be used to cleanup the corrupted NAND.<br>
    :point_right: The UBI partition is configured for SLC mode - otherwise the main line kernel will reject
    to use it by UBIFS. As a consequence this partition can use half the size of the MLC NAND only.
    For details refer to [Running UBI/UBIFS on MLC NAND](https://elinux.org/images/5/54/Weinberger.pdf).<br>
    <br>
  - The SPL and U-Boot images can be flashed to /dev/mtdX via the mtd-utils package tools:<br>
    ```
    sudo flash_erase /dev/mtd0 0 0
    sudo flash_erase /dev/mtd1 0 0
    sudo nandwrite -o -n /dev/mtd0 /boot/nand/sunxi-spl-with-ecc.bin
    sudo nandwrite -o -n /dev/mtd1 /boot/nand/sunxi-spl-with-ecc.bin
    sudo flash_erase /dev/mtd2 0 0
    sudo flash_erase /dev/mtd3 0 0
    sudo nandwrite -p /dev/mtd2 /boot/nand/u-boot-dtb.img
    sudo nandwrite -p /dev/mtd3 /boot/nand/u-boot-dtb.img
    ```
    Board will boot then without SD card .e.g. into a SATA rootfs


## [2022.12.09]

### Versions
- Armbian: v2022.12.09-wip [a438c08](https://github.com/MHARMBIAN/armbian_build/commit/a438c08aaa95890fe38bab23c28f2f19d5af06d7)
- U-Boot:  2022.07
- Kernel:  5.15.82
- Linux:   Ubuntu 20.04 LTS (Focal Fossa)

### Features
- SUNXI NAND SPL loading
- Support MTD slc-mode partition for Hynix MLC NAND H27UCG8T2ATR-BC

### Userpatches
- U-Boot 2022.07:
  - Enable NAND SPL for the Cubietruck_defconfig
  - Added few SPL NAND boot loggings
  - nand command(s) working on nand0 device
- Kernel 5.15:
  - Overlay DTS for Cubietruck with NAND boot and a UBI partition with slc-mode
  - MTD driver: Add pairing scheme for Hynix MLC NAND H27UCG8T2ATR-BC
- SDCard Image:
  - add NAND SPL boot image and U-Boot with dtb image for flashing to NAND to<br>
    `/usr/lib/linux-u-boot-current-cubietruck_v2022.12.09-wip_armhf`
  - NAND can be erased and flashed with system booted from the SD card
  - Following NAND partitions are defined:<br>
    ```
    /dev/mtd0 SPL           - size: 2MB   offset: 0x0
    /dev/mtd1 SPL.backup    - size: 2MB   offset: 0x200000
    /dev/mtd2 U-Boot        - size: 2MB   offset: 0x400000
    /dev/mtd4 U-Boot.backup - size: 2MB   offset: 0x600000
    /dev/mtd5 env           - size: 2MB   offset: 0x800000
    ```
    :warning: If `/dev/mtdN` device initialization fails on kernel startup due to too many bad blocks,
    then U-Boot has to be entered via serial line connected terminal. In U-Boot console
    either **`nand erase.chip`** or **`nand scrub.chip -y`** can be used to cleanup the corrupted NAND.<br>
    <br>  
  - The SPL and U-Boot images can be flashed to /dev/mtdX via the mtd-utils package tools:<br>
    ```
    sudo flash_erase /dev/mtd0 0 0
    sudo flash_erase /dev/mtd1 0 0
    sudo nandwrite -o -n /dev/mtd0 /boot/nand/sunxi-spl-with-ecc.bin
    sudo nandwrite -o -n /dev/mtd1 /boot/nand/sunxi-spl-with-ecc.bin
    sudo flash_erase /dev/mtd2 0 0
    sudo flash_erase /dev/mtd3 0 0
    sudo nandwrite -p /dev/mtd2 /boot/nand/u-boot-dtb.img
    sudo nandwrite -p /dev/mtd3 /boot/nand/u-boot-dtb.img
    ```
    Board will boot then without SD card .e.g. into a SATA rootfs


## [2022.11.30]

### Versions
- Armbian: v2022.11.30-wip [3b8e37f](https://github.com/MHARMBIAN/armbian_build/commit/3b8e37f311b787e4f8c45600fcadaef41a55af07)
- U-Boot:  2022.07
- Kernel:  5.15.80
- Linux:   Ubuntu 20.04 LTS (Focal Fossa)

### Features
- SUNXI NAND SPL loading
- Support MTD slc-mode partition for Hynix MLC NAND H27UCG8T2ATR-BC

### Userpatches
- U-Boot 2022.07:
  - Enable NAND SPL for the Cubietruck_defconfig
  - Added few SPL NAND boot loggings
- Kernel 5.15:
  - Overlay DTS for Cubietruck with NAND boot and a UBI partition with slc-mode
  - MTD driver: Add pairing scheme for Hynix MLC NAND H27UCG8T2ATR-BC
- SDCard Image:
  - add NAND SPL boot image and U-Boot with dtb image for flashing to NAND to<br>
    `/usr/lib/linux-u-boot-current-cubietruck_v2022.11.30-wip_armhf`
  - NAND can be erased and flashed with system booted from the SD card
  - Following NAND partitions are defined:<br>
    ```
    /dev/mtd0 SPL           - size: 2MB   offset: 0x0
    /dev/mtd1 SPL.backup    - size: 2MB   offset: 0x200000
    /dev/mtd2 U-Boot        - size: 2MB   offset: 0x400000
    /dev/mtd4 U-Boot.backup - size: 2MB   offset: 0x600000
    /dev/mtd5 env           - size: 2MB   offset: 0x800000
    ```
  - The SPL and U-Boot images can be flashed to /dev/mtdX via the mtd-utils package tools:<br>
    ```
    sudo flash_erase /dev/mtd0 0 0
    sudo flash_erase /dev/mtd1 0 0
    sudo nandwrite -o -n /dev/mtd0 /boot/nand/sunxi-spl-with-ecc.bin
    sudo nandwrite -o -n /dev/mtd1 /boot/nand/sunxi-spl-with-ecc.bin
    sudo flash_erase /dev/mtd2 0 0
    sudo flash_erase /dev/mtd3 0 0
    sudo nandwrite -p /dev/mtd2 /boot/nand/u-boot-dtb.img
    sudo nandwrite -p /dev/mtd3 /boot/nand/u-boot-dtb.img
    ```
    Board will boot then without SD card .e.g. into a SATA rootfs


## [2022.07.05]

### Versions
- U-Boot: 2021.10
- Kernel: 5.15.52
- Linux:  Ubuntu 20.04 LTS (Focal Fossa)

### Fixed
- SUNXI NAND SPL loading
- Support MTD slc-mode partition for Hynix MLC NAND H27UCG8T2ATR-BC

### Added
- Userpatches for Armbian build:
  - U-Boot 2021.10:
    - Enable NAND SPL for the Cubietruck_defconfig
    - Fix SUNXI NAND SPL loading
  - Kernel 5.15:
    - Overlay DTS for Cubietruck with NAND boot and a UBI partition with slc-mode
    - MTD driver: Add pairing scheme for Hynix MLC NAND H27UCG8T2ATR-BC
  - Linux:
    - add mtd-utils to installed packages
  - SDCard Image:
    - add NAND SPL boot image
    - add U-Boot with dtb image for flashing to NAND
    - NAND can be erased and flashed with system on the SD card

### Comments
- Initial release

<!--
## []

### NeverReleased
- This is just a dummy placeholder to make the parser of GHCICD/release-notes-from-changelog@v1 happy!
-->

[Unreleased]: https://github.com/MHARMBIAN/build_actions/compare/v2023.03.30..HEAD
[2023.03.30]: https://github.com/MHARMBIAN/build_actions/compare/v2023.03.29..v2023.03.30
[2023.03.29]: https://github.com/MHARMBIAN/build_actions/compare/v2022.12.09..v2023.03.29
[2022.12.09]: https://github.com/MHARMBIAN/build_actions/compare/v2022.11.30..v2022.12.09
[2022.11.30]: https://github.com/MHARMBIAN/build_actions/compare/v2022.07.05..v2022.11.30
[2022.07.05]: https://github.com/MHARMBIAN/build_actions/releases/tag/v2022.07.05
