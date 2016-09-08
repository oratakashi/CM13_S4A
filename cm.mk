# Release name
PRODUCT_RELEASE_NAME := S4A

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/Advan/S4A/device_S4A.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := S4A
PRODUCT_NAME := cm_S4A
PRODUCT_BRAND := Advan
PRODUCT_MODEL := S4A
PRODUCT_MANUFACTURER := Advan

##PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0/MRA58M/2280749:user/release-keys PRIVATE_BUILD_DESC="mt6572-user 6.0 MRA58M 2280749 release-keys"
