LOCAL_PATH := device/samsung/fortuna

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# Inherit from commons
$(call inherit-product, device/cyanogen/msm8916-common/msm8916.mk)
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/rootdir,root)

# Ramdisk Recovery
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/recovery,recovery/root)

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# media_profiles and media_codecs xmls for 8916
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += ${LOCAL_PATH}/media/media_profiles_8916.xml:system/etc/media_profiles.xml \
                      ${LOCAL_PATH}/media/media_codecs_8916.xml:system/etc/media_codecs.xml \
                      ${LOCAL_PATH}/media/media_codecs_8939.xml:system/etc/media_codecs_8939.xml \
                      ${LOCAL_PATH}/media/media_codecs_8929.xml:system/etc/media_codecs_8929.xml
endif

TARGET_USES_QCA_NFC := other

PRODUCT_PROPERTY_OVERRIDES += \
           dalvik.vm.heapgrowthlimit=128m

PRODUCT_BOOT_JARS += qcmediaplayer \
                     WfdCommon \
                     qcom.fmradio \
                     oem-services
PRODUCT_BOOT_JARS += vcard
PRODUCT_BOOT_JARS += tcmiface

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_PACKAGES += libtime_genoff

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    audio.msm8916 \
    audio_policy.msm8916 \
    libaudio-resampler

# Camera
PRODUCT_PACKAGES += \
    camera.msm8916 \
    libmm-qcamera

# Samsung
#PRODUCT_PACKAGES += \
#    charge_only_mode

# macloader
PRODUCT_PACKAGES += macloader

# Misc
PRODUCT_PACKAGES += \
    libxml2

# OMX
PRODUCT_PACKAGES += \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

# PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    # camera2.portability.force_api=1

PRODUCT_PACKAGES += \
    wlan_module_symlink \
    wlan_persist_symlink \
    wcnss_service

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Lights
PRODUCT_PACKAGES += \
    lights.msm8916

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

# Misc
PRODUCT_PACKAGES += \
    curl \
    libbson \
    libcurl \
    tcpdump

# Wifi
PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

# Wifi
PRODUCT_PACKAGES += \
    hostapd.accept \
    hostapd_default.conf \
    hostapd.deny \

PRODUCT_PACKAGES += \
    WCNSS_qcom_wlan_factory_nv.bin

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=190

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi