include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TachankaDeniedPreferences
TachankaDeniedPreferences_FILES = PCORootListController.m
TachankaDeniedPreferences_INSTALL_PATH = /Library/PreferenceBundles
TachankaDeniedPreferences_FRAMEWORKS = UIKit
TachankaDeniedPreferences_PRIVATE_FRAMEWORKS = Preferences
TARGET = iphone:11.2:10.0

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TachankaDeniedPreferences.plist$(ECHO_END)
