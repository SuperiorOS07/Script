#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
# Initialize ROM manifest
repo init -u https://github.com/SuperiorOS/manifest.git -b fourteen --git-lfs
# repo sync
/opt/crave/resync.sh
rm -rf device/xiaomi/mojito
rm -rf packages/resources/devicesettings
# cloning DT
# device tree
git clone https://github.com/SuperiorOS07/device_xiaomi_mojito.git --depth 1 -b mojito-universe device/xiaomi/mojito
git clone https://github.com/SuperiorOS07/android_device_xiaomi_sm6150-common.git --depth 1 -b mojito-universe device/xiaomi/sm6150-common
# kernel tree
git clone https://github.com/SuperiorOS07/kernel_xiaomi_mojito.git --depth 1 -b inline-rom kernel/xiaomi/mojito
# vendor tree
git clone https://gitlab.com/sachinbarange86/android_vendor_xiaomi_mojito.git --depth 1 -b 14 vendor/xiaomi/mojito
git clone https://gitlab.com/sachinbarange86/android_vendor_xiaomi_sm6150-common.git --depth 1 -b 14 vendor/xiaomi/sm6150-common
# hardware tree
git clone https://github.com/SuperiorOS07/android_hardware_xiaomi.git --depth 1 -b mojito hardware/xiaomi
git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git --depth 1 -b lineage-21.0 packages/resources/devicesettings
git clone --depth=1 https://gitlab.com/pnplusplus/android_vendor_xiaomi_mojito-leicacamera vendor/xiaomi/mojito-leicacamera
# set build environment
. build/envsetup.sh
# lunch
breakfast mojito
# bacon
m bacon
