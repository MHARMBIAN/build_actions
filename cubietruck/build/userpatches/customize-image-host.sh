#!/bin/bash

# This is the image pre-customization script
# running on host runtime context.
# It is included by the "source" statement within image-helpers.sh.
# Main purpose is, to provide files from host to the
# "$USERPATCHES_PATH"/overlay directory as a transfer directory.
#
display_alert "Copying NAND boot files to image" "customize-image-host.sh" "info"
mkdir -p "${USERPATCHES_PATH}/overlay/boot/nand"
rm --verbose -rf "${USERPATCHES_PATH}/overlay/boot/nand/*"
if [[ -f ${SRC}/cache/sources/${BOOTSOURCEDIR}/spl/sunxi-spl-with-ecc.bin ]]; then
	cp --verbose ${SRC}/cache/sources/${BOOTSOURCEDIR}/spl/sunxi-spl-with-ecc.bin ${USERPATCHES_PATH}/overlay/boot/nand
fi
if [[ -f ${SRC}/cache/sources/${BOOTSOURCEDIR}/u-boot-dtb.img ]]; then
	cp --verbose ${SRC}/cache/sources/${BOOTSOURCEDIR}/u-boot-dtb.img ${USERPATCHES_PATH}/overlay/boot/nand
fi
#
# EOF
#