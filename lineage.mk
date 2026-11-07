#
# Legacy compatibility wrapper. AndroidProducts.mk uses lineage_Z01KD_1.mk.
# Kept to avoid breaking external scripts that may reference this path.
#
$(call inherit-product, device/asus/Z01KD_1/lineage_Z01KD_1.mk)
