LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Wmadec.c \
	library_register.c

LOCAL_MODULE := libOMX.Exynos.WMA.Decoder
LOCAL_MODULE_RELATIVE_PATH := omx

LOCAL_CFLAGS := -Wno-mismatched-tags -Wno-unused-parameter -Wno-format -Wno-unused-variable -Wno-gnu-designator -Wno-error -Wno-unused-label

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libExynosOMX_Adec libExynosOMX_OSAL libExynosOMX_Basecomponent \
	libsrpapi
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libui \
	libExynosOMX_Resourcemanager libffmpegapi liblog

LOCAL_C_INCLUDES := $(EXYNOS_OMX_INC)/khronos \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal \
	$(EXYNOS_OMX_TOP)/core \
	$(EXYNOS_OMX_COMPONENT)/common \
	$(EXYNOS_OMX_COMPONENT)/audio/dec \
	$(EXYNOS_AUDIO_CODEC)/alp/include \
	$(EXYNOS_AUDIO_CODEC)/ffmpeg/include

include $(BUILD_SHARED_LIBRARY)
