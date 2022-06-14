#
# Copyright 2018 The Android Open Source Project
# Copyright 2014-2022 The Team Win LLC
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# API
#PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Set GMS client ID base
PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

# Apex libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libandroidicu

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib/libandroidicu.so

# Additional binaries & libraries needed for recovery
#TARGET_RECOVERY_DEVICE_MODULES += \
#    libion

#TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=$(PRODUCT_RELEASE_NAME) \
    TARGET_DEVICE=$(PRODUCT_RELEASE_NAME)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=$(PRODUCT_RELEASE_NAME)
