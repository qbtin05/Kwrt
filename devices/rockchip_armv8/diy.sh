#!/bin/bash

shopt -s extglob
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

#bash $SHELL_FOLDER/../common/kernel_6.6.sh

rm -rf package/boot target/linux/rockchip

git_clone_path master https://github.com/coolsnowwolf/lede target/linux/rockchip package/boot

wget -N https://github.com/istoreos/istoreos/raw/refs/heads/istoreos-23.05/target/linux/rockchip/patches-5.15/305-r2s-pwm-fan.patch -P target/linux/rockchip/patches-6.12/

wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/target/linux/generic/backport-6.12/203-v6.15-drivers-base-component-add-function-to-query-the-bound.patch -P target/linux/generic/backport-6.12/

sed -i "/KernelPackage,ptp/d" package/kernel/linux/modules/other.mk

rm -rf target/linux/rockchip/armv8/base-files/etc/uci-defaults/13_opkg_update package/feeds/kiddin9/pcat-manager package/feeds/kiddin9/*_QMI_WWAN

# Drop non-existent r8125/r8125-rss
# kmod-r8169 doesn't exist - keep the original packages
# sed -i -e 's,kmod-r8168,kmod-r8169,g' target/linux/rockchip/image/armv8.mk

# Remove references to non-existent packages in device profiles
# These packages don't exist in OpenWRT 25.12 package feeds
sed -i -e 's/kmod-r8125-rss//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-r8125//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-ata-ahci-dwc//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-usb-serial-option//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/luci-app-gpsysupgrade//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-r8169/kmod-r8168/g' target/linux/rockchip/image/armv8.mk

# Additional missing packages from error logs
sed -i -e 's/kmod-ata-ahci //g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-gpio-button-hotplug//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-usb-net-rtl8152//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-brcmfmac//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-aic8800u//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-aic8800s//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-mt7921e//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-ikconfig//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-hwmon-pwmfan//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-hwmon-drivetemp//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-dsa-rtl8365mb//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-fb-tft-st7789v//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/wpad-openssl/wpad-mbedtls/g' target/linux/rockchip/image/armv8.mk

# Remove various missing wireless firmware packages
sed -i -e 's/brcmfmac-firmware-43752-sdio//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/brcmfmac-nvram-43430-sdio//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/brcmfmac-nvram-4356-sdio//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/cypress-firmware-4356-sdio//g' target/linux/rockchip/image/armv8.mk

# Remove pcat-firmware and pcat-manager references
sed -i -e 's/pcat-firmware//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/pcat-manager//g' target/linux/rockchip/image/armv8.mk

# Remove kmod-ath10k packages that are missing
sed -i -e 's/kmod-ath10k-sdio//g' target/linux/rockchip/image/armv8.mk
sed -i -e 's/kmod-ath10k //g' target/linux/rockchip/image/armv8.mk

# Drop missing mt7916 firmware package
sed -i -e 's/kmod-mt7916-firmware//g' target/linux/rockchip/image/armv8.mk

# Clean up any double spaces left by removals
sed -i -e 's/  \+/ /g' target/linux/rockchip/image/armv8.mk

sed -i -e '/KERNEL_TESTING_PATCHVER/d' -e 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += fdisk lsblk kmod-drm-rockchip luci-app-diskman/' -e 's/autocore-arm/autocore/' target/linux/rockchip/Makefile

sed -i 's/Ariaboard/光影猫/' target/linux/rockchip/image/armv8.mk