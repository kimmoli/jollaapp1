# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = testi1

CONFIG += sailfishapp

SOURCES += src/testi1.cpp

OTHER_FILES += qml/testi1.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/testi1.spec \
    rpm/testi1.yaml \
    testi1.desktop \
    qml/pics/eketux.png \
    qml/pages/ThirdPage.qml \
    qml/pages/FourthPage.qml \
    qml/pages/InfoBanner.qml \
    qml/pages/OrientationTest.qml \
    qml/pages/WevView.qml \
    qml/pages/Sensors.qml \
    qml/pics/sc-fish5.png \
    qml/pics/sc-fish4.png \
    qml/pics/sc-fish3.png \
    qml/pics/sc-fish2.png \
    qml/pics/sc-fish1.png \
    qml/pics/sc-fish0.png \
    qml/pics/nomnom.wav \
    qml/pics/sc-snowflakes7.png \
    qml/pages/Snowflakes.qml \
    qml/pages/hiutale.qml \
    qml/pics/sc-fish6.png \
    qml/pics/kahenkilonsiika.wav

