import QtQuick 2.0
import Sailfish.Silica 1.0


Page
{
    id: page
    Rectangle {
        id: colorIndicator
        color: "transparent"
        width: theme.itemSizeSmall
        height: theme.itemSizeSmall
    }

    Button {
        id: button2
        text: "Choose a color"

        onClicked: {
            var dialog = pageStack.push("Sailfish.Silica.ColorPickerDialog")
            dialog.accepted.connect(function() {
                colorIndicator.color = dialog.color
            })
        }
    }
}
