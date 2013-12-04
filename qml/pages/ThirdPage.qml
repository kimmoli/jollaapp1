import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    SilicaListView {
        id: listView
        model: 5
        anchors.fill: parent
        header: PageHeader {
            title: "Kolmas sivu"
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                text: "Läppä " + index
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            onClicked: console.log("Clicked " + index)
        }
    }
}

/*
Page {
    id: pagethree
    SilicaFlickable {
        anchors.fill: parent
        width: 150; height: 150
        contentWidth: 300; contentHeight: 300
        header: PageHeader {
            title: "Kolmas sivu"
        }

        rebound: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }

        Rectangle {
            width: 300; height: 300
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightsteelblue" }
                GradientStop { position: 1.0; color: "blue" }
            }
        }
    }
}
*/
