import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    ListModel
    {
        id: omalista

        ListElement
        {
            pingu: 100
        }
    }

    Column
    {
        id: column

        width: page.width
        spacing: Theme.paddingLarge
        PageHeader
        {
            title: "Valitse omasi"
        }

        SlideshowView
        {
            id: view
            width: 480
            height: 200
            itemWidth: width / 2

            model: 5
            delegate: BackgroundItem
            {
                width: view.itemWidth
                height: view.height
                onClicked:
                {
                    lappu.text = "Valitsit " + (index +1)
                    mytux.scale = (index+1)
                    info.displayError("huu " + (index+1))
                }
                Image
                {
                    id: pic
                    source: "../pics/eketux.png"
                    anchors.centerIn: parent
                    scale: ((index+1)/5.0)
                }
                Label
                {
                    text: index + 1
                    font.pixelSize: Theme.fontSizeLarge

                }

//                MouseArea
//                {
//                    anchors.fill: parent
//                    onClicked: omalista.append({"pingu":index})
//                }
            }

        }
        Label
        {
            text: view.currentIndex + 1
            font.pixelSize: Theme.fontSizeLarge
        }
        Label
        {
            id: lappu
            text: ""
            font.pixelSize: Theme.fontSizeLarge

        }
        Slider
        {
            id: ss
            width: column.width
            anchors.horizontalCenter: column.Center
            minimumValue: 0
            maximumValue: 360
            value: 0
        }
        Image
        {
            id: mytux
            x: (page.width/2)-(mytux.width/2)
            source: "../pics/eketux.png"
            Behavior on scale { NumberAnimation { duration: 500; easing.type: Easing.Linear } }
            Behavior on rotation { NumberAnimation { duration: 500; easing.type: Easing.Linear } }
            rotation: ss.value
        }


     } // column

} // page




