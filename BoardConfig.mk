FORCE_32_BIT := true

# Inherit from commons
-include device/cyanogen/msm8916-common/BoardConfigCommon.mk
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/fortuna
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
BOARD_VENDOR := samsung

# Asserts
TARGET_OTA_ASSERT_DEVICE := grandprimelte,fortuna,gprimeltetmo,gprimeltespr,gprimeltecan

# Audio and media
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := caf

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CPU
TARGET_CPU_CORTEX_A53 := true

# default.prop
ADDITIONAL_DEFAULT_PROPERTIES += \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.add_power_save=1 \
	persist.radio.snapshot_enabled=1 \
	persist.radio.snapshot_timer=22 \
	persist.eons.enabled=false \
	persist.data.netmgrd.qos.enable=false \
	telephony.lteOnCdmaDevice=1 \
	rild.libpath=/system/lib/libsec-ril.so \
	persist.cne.feature=0 \
	persist.radio.lte_vrte_ltd=1 \
	camera2.portability.force_api=1

# Display
TARGET_HAVE_NEW_GRALLOC := true
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_USES_NEW_ION_API := true

# Encryption
TARGET_SWV8_DISK_ENCRYPTION := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# GPS
TARGET_NO_RPC := true

# Init
#TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_fortuna.c
#TARGET_UNIFIED_DEVICE := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
TARGET_KERNEL_SOURCE := kernel/samsung/fortuna
TARGET_KERNEL_CONFIG := msm8916_sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8916_sec_fortuna_canopen_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488 #13312 * 1024 mmcblk0p16 
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608 # 8192 * 1024 mmcblk0p22
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640 #15360 * 1024 mmcblk0p17
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1568669696 #1531904 * 1024 mmcblk0p24 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5637124096 # 5505004 * 1024 mmcblk0p27

# Properties (using the common one)
# TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop

# Qualcomm support
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
ifeq ($(TW),)
	TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
else
	TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/twrp.fstab
endif

#SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
	file_contexts
    # bluetooth_loader.te \
    # file.te \
    # 
    # system_app.te \
    # system_server.te \
    # system.te \
    # wcnss_service.te

# TWRP
RECOVERY_VARIANT := twrp
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
# TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,discard,journal_async_commit,errors=panic wait,check,encryptable=footer"
# TW_CRYPTO_FS_TYPE := "ext4"
# TW_CRYPTO_KEY_LOC := "footer"
# TW_CRYPTO_MNT_POINT := "/data"
# TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/7824900.sdhci/by-name/userdata"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_HAS_DOWNLOAD_MODE := true
TW_HAS_MTP := true
# TW_IGNORE_MAJOR_AXIS_0 := true
TW_INCLUDE_CRYPTO := true
TW_INPUT_BLACKLIST := "accelerometer"
#TW_INTERNAL_STORAGE_PATH := "/data/media/0"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
# TW_MAX_BRIGHTNESS := 255
# TW_MTP_DEVICE := /dev/usb_mtp_gadget
TW_NEW_ION_HEAP := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_SCREEN_TIMEOUT := true
TW_TARGET_USES_QCOM_BSP := true
TW_THEME := portrait_hdpi

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"

# inherit from the proprietary version
-include vendor/samsung/fortuna/BoardConfigVendor.mk