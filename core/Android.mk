LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Component_Register.c \
	Exynos_OMX_Core.c

LOCAL_MODULE := libExynosOMX_Core

LOCAL_CFLAGS := -Wno-mismatched-tags -Wno-unused-parameter -Wno-format -Wno-unused-variable -Wno-gnu-designator -Wno-error -Wno-unused-label
LOCAL_CFLAGS += -Wno-error

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libExynosOMX_OSAL libExynosOMX_Basecomponent
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils \
	libExynosOMX_Resourcemanager liblog

LOCAL_C_INCLUDES := \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal \
	$(EXYNOS_OMX_TOP)/component/common

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

ifeq ($(BOARD_USE_KHRONOS_OMX_HEADER), true)
LOCAL_CFLAGS += -DUSE_KHRONOS_OMX_HEADER
LOCAL_C_INCLUDES += $(EXYNOS_OMX_INC)/khronos
else
ifeq ($(BOARD_USE_ANDROID), true)
LOCAL_C_INCLUDES += $(ANDROID_MEDIA_INC)/openmax
endif
endif

include $(BUILD_SHARED_LIBRARY)

