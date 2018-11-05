include $(sort $(wildcard $(BR2_EXTERNAL_LINBO_PATH)/package/*/*.mk))

# ntfs-3g: activate acls, use ntfs-3g with mount command
NTFS_3G_CONF_OPTS += --enable-posix-acls
define NTFS_3G_MOUNT_USE_NTFS_3G
	( cd $(TARGET_DIR)/usr/sbin; ln -sf ../bin/ntfs-3g mount.ntfs )
endef
NTFS_3G_POST_INSTALL_TARGET_HOOKS += NTFS_3G_MOUNT_USE_NTFS_3G

# xkbcommon: activate german keyboard as default
LIBXKBCOMMON_CONF_OPTS += --with-default-layout=de --with-default-variant=nodeadkeys

# busybox config: redefine FIXUP_CMDS - add ntpd, use ash instead of bash
define BUSYBOX_EXTERNAL_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NTPD,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_NTPD_CONF,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_ENABLE_OPT,CONFIG_BASH_IS_ASH,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_DISABLE_OPT,CONFIG_BASH_IS_NONE,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_VOLUMEID_BTRFS,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_VOLUMEID_LINUXSWAP,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_VOLUMEID_REISERFS,$(BUSYBOX_BUILD_CONFIG))
	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_VOLUMEID_SQUASHFS,$(BUSYBOX_BUILD_CONFIG))
endef

BUSYBOX_KCONFIG_FIXUP_CMDS += $(call BUSYBOX_EXTERNAL_FIXUPS)
