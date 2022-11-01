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

[Unreleased]: https://github.com/MHARMBIAN/build_actions/compare/v2022.07.05..HEAD
[2022.07.05]: https://github.com/MHARMBIAN/build_actions/releases/tag/v2022.07.05
