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
    qml/pages/ThirdPage.qml

