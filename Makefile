BINARY_NAME = system-updater
VERSION = 0.1

BIN_PATH = usr/local/bin/
APP_PATH = usr/share/applications/
PKG_NAME = $(BINARY_NAME)_$(VERSION)-1_all.deb

deb_package:
	mkdir -p PKG_SOURCE/$(BIN_PATH)
	mkdir -p PKG_SOURCE/$(APP_PATH)
	cp -r debian PKG_SOURCE/DEBIAN
	cp -r src/system-updater PKG_SOURCE/$(BIN_PATH)
	cp -r src/system-updater.desktop PKG_SOURCE/$(APP_PATH)
	dpkg-deb --root-owner-group --build PKG_SOURCE $(PKG_NAME)
	rm -r PKG_SOURCE
