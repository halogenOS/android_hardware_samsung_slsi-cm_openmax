LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Mp3dec.c \
	library_register.c

LOCAL_MODULE := libOMX.Exynos.MP3.Decoder
LOCAL_MODULE_RELATIVE_PATH := omx

LOCAL_CFLAGS := -Wno-mismatched-tags -Wno-unused-parameter -Wno-format -Wno-unused-variable -Wno-gnu-designator -Wno-error -Wno-unused-label

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libExynosOMX_Adec libExynosOMX_OSAL libExynosOMX_Basecomponent \
	libsrpapi
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libui \
	libExynosOMX_Resourcemanager liblog

LOCAL_C_INCLUDES := \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal \
	$(EXYNOS_OMX_TOP)/core \
	$(EXYNOS_OMX_COMPONENT)/common \
	$(EXYNOS_OMX_COMPONENT)/audio/dec \
	$(EXYNOS_AUDIO_CODEC)/alp/include

ifeq ($(BOARD_USE_KHRONOS_OMX_HEADER), true)
LOCAL_CFLAGS += -DUSE_KHRONOS_OMX_HEADER
LOCAL_C_INCLUDES += $(EXYNOS_OMX_INC)/khronos
else
ifeq ($(BOARD_USE_ANDROID), true)
LOCAL_C_INCLUDES += $(ANDROID_MEDIA_INC)/openmax
endif
endif

include $(BUILD_SHARED_LIBRARY)
