LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),fortuna)

include $(call all-subdir-makefiles,$(LOCAL_PATH))
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

$(shell mkdir -p $(TARGET_OUT)/lib/modules/pronto; \
        ln -sf  ../wlan.ko \
               $(TARGET_OUT)/lib/modules/pronto/pronto_wlan.ko)
endif