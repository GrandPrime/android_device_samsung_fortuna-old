FORCE_32_BIT := true

-include device/cyanogen/msm8916-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/fortuna
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
BOARD_VENDOR := samsung

# Asserts
TARGET_OTA_ASSERT_DEVICE := grandprimelte,fortuna

# Audio
TARGET_USES_QCOM_MM_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS += $(LOCAL_PATH)/cmhw/src

# Compression - Smoosh all the things
# TARGET_TRANSPARENT_COMPRESSION_METHOD := lz4

# Display
TARGET_HAVE_NEW_GRALLOC := true
TARGET_USES_NEW_ION_API := true

# Encryption
TARGET_SWV8_DISK_ENCRYPTION := true

# GPS
TARGET_NO_RPC := true

# Init
TARGET_LDPRELOAD := libNimsWrap.so

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/fortuna
#TARGET_KERNEL_SOURCE := kernel/samsung/msm8916-common/
#TARGET_KERNEL_CONFIG := cyanogenmod_fortuna_defconfig
TARGET_KERNEL_CONFIG := msm8916_sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8916_sec_fortuna_tmo_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
# BOARD_KERNEL_CMDLINE := androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
# BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M androidboot.bootdevice=soc.0 utags.blkdev=/dev/block/platform/soc.0/by-name/utags utags.backup=/dev/block/platform/soc.0/by-name/utagsBackup movablecore=160M
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488 #13312 * 1024 mmcblk0p16 
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608 # 8192 * 1024 mmcblk0p22
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640 #15360 * 1024 mmcblk0p17
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1568669696 #1531904 * 1024 mmcblk0p24 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5637124096 # 5505004 * 1024 mmcblk0p27

# Properties
TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_USES_QCOM_BSP := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_USERIMAGES_USE_EXT4 := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth_loader.te \
    file.te \
    file_contexts \
    system_app.te \
    system_server.te \
    system.te \
    wcnss_service.te

# TWRP
RECOVERY_VARIANT := twrp
BOARD_HAS_NO_SELECT_BUTTON := true
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
# TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/twrp.fstab
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,discard,journal_async_commit,errors=panic wait,check,encryptable=footer"
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_KEY_LOC := "footer"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/7824900.sdhci/by-name/userdata"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_HAS_DOWNLOAD_MODE := true
TW_HAS_MTP := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_SAMSUNG := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_NEW_ION_HEAP := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_SCREEN_TIMEOUT := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_TARGET_USES_QCOM_BSP := true

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Wifi
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
# The uncompressed arm64 is too large, split wifi for now
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"

# inherit from the proprietary version
-include vendor/samsung/fortuna/BoardConfigVendor.mk