GO_EASY_ON_ME=1
ARCHS = armv7s
include theos/makefiles/common.mk
ADDITIONAL_OBJCFLAGS = -fobjc-arc

TWEAK_NAME = sshot
sshot_FILES = Tweak.xm

sshot_FRAMEWORKS = UIKit 
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
