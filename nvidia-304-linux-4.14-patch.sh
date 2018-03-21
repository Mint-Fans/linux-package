# xf86-video-nvidia-legacy
# for Debian
sed -i 's/drm_pci_init/drm_legacy_pci_init/g' nv-drm.c
sed -i 's/drm_pci_exit/drm_legacy_pci_exit/g' nv-drm.c
