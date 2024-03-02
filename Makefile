# Copyright (C) 2023 Findlay Feng <i@fengch.me>

include $(TOPDIR)/rules.mk

PKG_NAME:=jd
PKG_VERSION:=1.7.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/josephburnett/jd.git
PKG_MIRROR_HASH:=df5a8e766d8dadbd9cd595a8f3d7ed12735e8d3eb07f8d4f8131606bf272d73c
PKG_SOURCE_VERSION:=10b75654ac60a1e966755114b18eba6c68340ee8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Findlay Feng <i@fengch.me>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1

GO_PKG:=github.com/josephburnett/jd
GO_PKG_EXCLUDES:=web/ui web/pack

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/jd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=diffing and patching JSON and YAML values.
  URL:=https://github.com/josephburnett/jd
endef

define Package/jd/description
	jd is a commandline utility and Go library for diffing and patching
	JSON and YAML values. It supports a native jd format (similar to
	unified format) as well as JSON Merge Patch (RFC 7386) and a subset
	of JSON Patch (RFC 6902). Try it out at http://play.jd-tool.io/.
endef

define Build/Compile
	$(call GoPackage/Build/Compile)
endef

$(eval $(call GoBinPackage,jd))
$(eval $(call BuildPackage,jd))
