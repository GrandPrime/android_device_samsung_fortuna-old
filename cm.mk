# Release name
PRODUCT_RELEASE_NAME := fortuna

# Boot animation
TARGET_SCREEN_WIDTH := 540
TARGET_SCREEN_HEIGHT := 960

$(call inherit-product, device/samsung/fortuna/full_fortuna.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fortuna
PRODUCT_NAME := cm_fortuna
PRODUCT_BRAND := samsung
PRODUCT_MODEL := fortuna
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=1