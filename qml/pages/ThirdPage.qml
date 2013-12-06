import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    SilicaFlickable
    {
        anchors.fill: parent


        Timer
        {
            id: timer2
            interval: 100; running: true; repeat: true
            onTriggered:
            {
                bar.value = bar.value + 1
                if (bar.value >= bar.maximumValue)
                {
                    bar.value = bar.minimumValue
                }
            }
        } // Timer

        Column
        {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            PageHeader
            {
                title: "Heippa taas"
            }

            ProgressBar
            {
                id: bar
                anchors.horizontalCenter: column.Center
                width: column.width
                maximumValue: 100
                value: 50
            }

            Button
            {
               text: "edellinen sivu"
               anchors.horizontalCenter: column.Center
               onClicked: pageStack.pop()
            }
            Button
            {
               text: "Uusi sivu"
               anchors.horizontalCenter: column.Center
               onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }

            TextField {
                id: nameField
                width: 480
                placeholderText: "Kirjoita nimesi"
            }

            ComboBox {
                width: page.width

                label: (nameField.text ? nameField.text + ", Valintasi on " : "Valintasi on ")

                menu: ContextMenu {
                    MenuItem { text: "Joulu" }
                    MenuItem { text: "Juhannus" }
                    MenuItem { text: "Vappu" }
                    MenuItem { text: "Pääsiäinen" }
                }
            }

            TextSwitch {
                id: mute
                text: "Täppä"
                description: "Tämän voi laittaa päälle tai pois"
            }
            Label
            {
                x: Theme.paddingLarge
                text: "Täppä on " + (mute.checked ? "päällä" : "pois")
                font.pixelSize: Theme.fontSizeLarge
            }
            Label
            {
                x: Theme.paddingLarge
                text: "palkki menee " + bar.value
                font.pixelSize: Theme.fontSizeLarge
            }


        }
    }
}

