# Manage Releases

## Release version naming
- These ARMBIAN builds are provided as released SD-Card boot images with detailed release notes  
  via this repos [Release](https://github.com/MHARMBIAN/build_actions/releases) page.
- The name of a release contains the board name and the git tag it belongs to.

## Pre-Requisites
- The release notes have to be maintained manually in [CHANGELOG.md](https://github.com/MHARMBIAN/build_actions/blob/master/CHANGELOG.md) - any details can be found in the comment section within this file.

## Building a release
- Releases are built by the `build_release.yml` GitHub Action workflow of this project.
- A release build is triggered by applying a tag with name '**v**YYYY.MM.DD' to the corresponding most recent commit of this release.
- The release workflow is not triggered, if:
  - The release tag is not of format `v[0-9]+.[0-9]+.[0-9]+`
- The release workflow is failing and no release will be created, if:
  - The `CHANGELOG.md` does not contain a line of format '# [YYYY.MM.DD]' matching the release version
  - The `CHANGELOG.md` does not contain an appropriate compare link versus the previous release version at the end of the `CHANGELOG.md` file
