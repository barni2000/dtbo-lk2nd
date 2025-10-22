#!/bin/sh
set -e
# https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay
dtc -O dtb -o sdm632-xiaomi-onclite.dtbo -b 0 -@ sdm632-xiaomi-onclite.dts
mkdtboimg cfg_create dtbo-xiaomi-onclite.img dtboimg-xiaomi-onclite.cfg
dtc -O dtb -o sdm439-xiaomi-pine.dtbo -b 0 -@ sdm439-xiaomi-pine.dts
mkdtboimg cfg_create dtbo-xiaomi-pine.img dtboimg-xiaomi-pine.cfg
dtc -O dtb -o sdm439-xiaomi-olive.dtbo -b 0 -@ sdm439-xiaomi-olive.dts
mkdtboimg cfg_create dtbo-xiaomi-olive.img dtboimg-xiaomi-olive.cfg
dtc -O dtb -o sdm429-lenovo-tbx505x.dtbo -b 0 -@ sdm429-lenovo-tbx505x.dts
mkdtboimg cfg_create dtbo-lenovo-tbx505x.img dtboimg-lenovo-tbx505x.cfg
dtc -O dtb -o sdm429-fossil-hoki.dtbo -b 0 -@ sdm429-fossil-hoki.dts
mkdtboimg cfg_create dtbo-fossil-hoki.img dtboimg-fossil-hoki.cfg
dtc -O dtb -o sdm439-nokia-panther.dtbo -b 0 -@ sdm439-nokia-panther.dts
mkdtboimg cfg_create dtbo-nokia-panther.img dtboimg-nokia-panther.cfg
dtc -O dtb -o sdm632-motorola-ocean.dtbo -b 0 -@ sdm632-motorola-ocean.dts
mkdtboimg cfg_create dtbo-motorola-ocean.img dtboimg-motorola-ocean.cfg
dtc -O dtb -o sdm450-oppo-rmx1805.dtbo -b 0 -@ sdm450-oppo-rmx1805.dts
mkdtboimg cfg_create dtbo-oppo-rmx1805.img dtboimg-oppo-rmx1805.cfg
