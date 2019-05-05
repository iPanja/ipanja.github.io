include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TachankaDenied
TachankaDenied_FILES = Tweak.xm
TARGET = iphone:11.2:10.0
PACKAGE_VERSION=2.0.0

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

internal-stage::
	mkdir -p "$(THEOS_STAGING_DIR)/Library/Application Support/TachankaDenied.bundle"
	cp Resources/* "$(THEOS_STAGING_DIR)/Library/Application Support/TachankaDenied.bundle/"
SUBPROJECTS += tachankadeniedpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
include $(THEOS_MAKE_PATH)/tool.mk
