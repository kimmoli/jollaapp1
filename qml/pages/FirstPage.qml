/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page
{
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable
    {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu
        {
            MenuItem
            {
                text: "Pitkä lista"
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            MenuItem
            {
                text: "Kaikenlaista"
                onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }
            MenuItem
            {
                text: "Pingu zoom rotate"
                onClicked: pageStack.push(Qt.resolvedUrl("FourthPage.qml"))
            }

        }

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PushUpMenu
        {
            MenuItem
            {
                text: "Orientaatiotesti"
                onClicked: pageStack.push(Qt.resolvedUrl("OrientationTest.qml"))
            }

            MenuItem
            {
                text: "webbiselain"
                onClicked: pageStack.push(Qt.resolvedUrl("WevView.qml"))
            }
            MenuItem
            {
                text: "Omnomnom peli"
                onClicked: pageStack.push(Qt.resolvedUrl("Sensors.qml"))
            }
            MenuItem
            {
                text: "Lumihiutale"
                onClicked: pageStack.push(Qt.resolvedUrl("Snowflakes.qml"))
            }


        }



        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column
        {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader
            {
                title: "Heippa vaan!"
            }
            Label
            {
                x: Theme.paddingLarge
                text: "Kimmo testaa"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeLarge
            }
            Image
            {
                id: logo
                source: "../pics/eketux.png"
                anchors.horizontalCenter: column.horizontalCenter
                smooth: true
                Behavior on rotation { NumberAnimation { duration: 500; easing.type: Easing.Linear } }
            }
        }

        Timer
        {
            id: timer1
            interval: 500; running: true; repeat: true
            onTriggered:
            {
                logo.rotation = logo.rotation + 10
            }
        } // Timer

    }
}


