LDD_VERSION = 'e74cb088869c96d40635c228970b6740ea333faf'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-lizzyhllrn.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS = misc-modules

define LDD_INSTALL_TARGET_CMDS
	mkdir -p $(BR2_ROOTFS_OVERLAY)/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(BR2_ROOTFS_OVERLAY)/bin/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(BR2_ROOTFS_OVERLAY)/bin/scull_unload	
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(BR2_ROOTFS_OVERLAY)/bin/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(BR2_ROOTFS_OVERLAY)/bin/module_unload
	
endef

$(eval $(kernel-module))
$(eval $(generic-package))
