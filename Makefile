NAME = system-updater
VERSION = 0.2
PKG_VERSION = 1
ARCH = all
PKG_NAME = $(NAME)_$(VERSION)-$(PKG_VERSION)_$(ARCH).deb

BIN_PATH = usr/local/bin/
APP_PATH = usr/share/applications/

deb_package:
	mkdir -p PKG_SOURCE
	cp -r debian PKG_SOURCE/DEBIAN
	
	mkdir -p PKG_SOURCE/$(BIN_PATH)
	mkdir -p PKG_SOURCE/$(APP_PATH)
	cp -r src/system-updater PKG_SOURCE/$(BIN_PATH)
	cp -r src/system-updater.desktop PKG_SOURCE/$(APP_PATH)
	
	dpkg-deb --root-owner-group --build PKG_SOURCE $(PKG_NAME)
	rm -r PKG_SOURCE
