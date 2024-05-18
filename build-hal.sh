#!/bin/bash
source halium.env
cd /home/runner/work/ubports-ci-4a/ubports-ci-4a/halium

source build/envsetup.sh
export USE_CCACHE=1
breakfast $DEVICE
make -j$(nproc) mkbootimg
make -j$(nproc) hybris-boot
make -j$(nproc) hybris-recovery
make -j$(nproc) halium-boot
make -j$(nproc) recoveryimage
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum /home/runner/work/ubports-ci-4a/ubports-ci-4a/halium/out/target/product/rolex/halium-boot.img
md5sum /home/runner/work/ubports-ci-4a/ubports-ci-4a/halium/out/target/product/rolex/halium-recovery.img
md5sum /home/runner/work/ubports-ci-4a/ubports-ci-4a/halium/out/target/product/rolex/recovery.img
md5sum /home/runner/work/ubports-ci-4a/ubports-ci-4a/halium/out/target/product/rolex/system.img
