import QtQuick 2.0
import Sailfish.Silica 1.0



Page {
    allowedOrientations: Orientation.All
    property int etsi: 1
    SilicaWebView
    {

        id: webView
        anchors.fill: parent

        url: "https://www.google.fi/"

        header: SearchField
        {
            id: searchField
            property string acceptedInput: ""

            placeholderText: "Etsi..."
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            EnterKey.enabled: text.trim().length > 0
            EnterKey.text: "Etsi"

            Component.onCompleted:
            {
                acceptedInput = ""
                _editor.accepted.connect(searchEntered)
            }

            // is called when user presses the Return key
            function searchEntered()
            {
                searchField.acceptedInput = text
                if (etsi == 1)
                {
                    webView.url = "https://www.google.fi/search?q=" + ( acceptedInput === "" ? "" : encodeURIComponent(acceptedInput) )
                }
                else
                {
                    webView.url = ( acceptedInput === "" ? "" : encodeURIComponent(acceptedInput) )
                }
            }

        } // searchfield

        PullDownMenu
        {
            MenuItem
            {
                text: "Lopeta"
                onClicked: pageStack.pop()
            }
            MenuItem
            {
                text: (etsi == 1 ? "Anna url" : "Etsi...")
                onClicked:
                {
                    if (etsi == 1)
                    {
                        searchField.placeholderText = "Osoite:"
                        searchField.EnterKey.text = "Mene"
                        etsi = 0
                    }
                    else
                    {
                        searchField.placeholderText = "Etsi..."
                        searchField.EnterKey.text = "Etsi"
                        etsi = 1
                    }
                }
            }

        }
    }

    ProgressCircle
    {
        id: loadingProgressIndicator
        anchors.centerIn: parent
        visible: webView.loading
        value: webView.loadProgress / 100
    }

}
