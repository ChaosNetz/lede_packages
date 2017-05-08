include $(TOPDIR)/rules.mk

PKG_NAME:=chaosnetz_fastd_backbone
PKG_VERSION:=1

PKG_LICENSE:=BSD-2-Clause

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/chaosnetz_fastd_backbone
  SECTION:=Chaosnetz
  CATEGORY:=Chaosnetz
  DEPENDS:=+fastd
  TITLE:=Backbone-VPN configuration for Chaosnetz Lede Nodes
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/chaosnetz_fastd_backbone/install
	$(INSTALL_DIR) $(1)/lib/chaosnetz/fastd_backbone
	$(INSTALL_BIN) ./src/*.uci $(1)/lib/chaosnetz/fastd_backbone
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./src/uci-defaults $(1)/etc/uci-defaults/chaosnetz_fastd_backbone
endef

$(eval $(call BuildPackage,chaosnetz_fastd_backbone))
