#!/bin/sh

# Remove any previous build.
rm -rf ./AppDir | true

# Make appdir and copy quarto files.
mkdir ./AppDir
cp -T -r ./package/pkg-working/ ./AppDir/usr/

# Add icon and desktop file.
mkdir -p ./AppDir/usr/share/icons
cp ./package/scripts/linux/appimage/quarto.svg ./AppDir/usr/share/icons/
mkdir -p ./AppDir/usr/share/applications/
cp ./package/scripts/linux/appimage/quarto.desktop ./AppDir/usr/share/applications/

# Add AppRun file
cp ./package/scripts/linux/appimage/AppRun ./AppDir/AppRun
chmod a+x ./AppDir/AppRun

# Get and run appimagetool
wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
ARCH=$TARGET_ARCH ./appimagetool-x86_64.AppImage ./AppDir
