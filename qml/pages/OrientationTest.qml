/****************************************************************************************
**
** Copyright (C) 2013 Jolla Ltd.
** Contact: Matt Vogt <matthew.vogt@jollamobile.com>
** All rights reserved.
**
** This file is part of Sailfish Silica UI component package.
**
** You may use this file under the terms of BSD license as follows:
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**     * Redistributions of source code must retain the above copyright
**       notice, this list of conditions and the following disclaimer.
**     * Redistributions in binary form must reproduce the above copyright
**       notice, this list of conditions and the following disclaimer in the
**       documentation and/or other materials provided with the distribution.
**     * Neither the name of the Jolla Ltd nor the
**       names of its contributors may be used to endorse or promote products
**       derived from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
** ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator {}
        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge

            Column
            {
                x: Theme.paddingLarge
                width: parent.width - 2*Theme.paddingLarge
                spacing: Theme.paddingLarge
                PageHeader { title: "Change orientation" }

                Row
                {
                    Label
                    {
                        anchors.verticalCenter: parent.verticalCenter
                        text: 'Top: '
                    }
                    IconButton
                    {
                        // Demonstrate the use of page.orientation to synchronize with transition
                        anchors.verticalCenter: parent.verticalCenter
                        icon.source: (orientation === Orientation.Portrait ? "image://theme/icon-l-up" :
                                      (orientation === Orientation.Landscape ? "image://theme/icon-l-left" :
                                       (orientation === Orientation.PortraitInverted ? "image://theme/icon-l-down" : "image://theme/icon-l-right")))
                    }
                }
            }
            Column
            {
                // No spacing in this column
                width: parent.width
                TextSwitch {
                    id: lockToggle
                    text: "Lock"
                    onCheckedChanged: {
                        if (checked) {
                            // Set the allowed orientations to only permit the current orientation
                            allowedOrientations = mainWindow.orientation
                        } else {
                            allowedOrientations = Orientation.All
                        }
                    }
                }
                TextSwitch { id: transitionToggle
                    text: "Custom Transition"

                    onCheckedChanged: {
                        if (checked) {
                            orientationTransitions = [ customTransition ]
                        } else {
                            orientationTransitions = [ defaultOrientationTransition ]
                        }
                    }

                    property Transition customTransition: Transition {
                        to: 'Portrait,Landscape,PortraitInverted,LandscapeInverted'
                        from: 'Portrait,Landscape,PortraitInverted,LandscapeInverted'
                        SequentialAnimation {
                            PropertyAction {
                                target: page
                                property: 'orientationTransitionRunning'
                                value: true
                            }
                            ParallelAnimation {
                                PropertyAnimation {
                                    target: page
                                    properties: 'width,height'
                                    duration: 500
                                    easing.type: Easing.InOutCubic
                                }
                                RotationAnimation {
                                    target: page
                                    properties: 'rotation'
                                    duration: 500
                                    direction: RotationAnimation.Shortest
                                    easing.type: Easing.InOutCubic
                                }

                                SequentialAnimation {
                                    PropertyAnimation {
                                        target: page
                                        property: 'scale'
                                        to: 0.66
                                        duration: 250
                                        easing.type: Easing.InCubic
                                    }
                                    PropertyAction {
                                        target: page
                                        property: 'orientation'
                                    }
                                    PropertyAnimation {
                                        target: page
                                        property: 'scale'
                                        to: 1
                                        duration: 250
                                        easing.type: Easing.OutCubic
                                    }
                                }
                            }
                            PropertyAction {
                                target: page
                                property: 'orientationTransitionRunning'
                                value: false
                            }
                        }
                    }
                }
            }
            Button
            {
                text: "Portrait"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    allowedOrientations = Orientation.Portrait
                    lockToggle.checked = true
                }
            }
            Button
            {
                text: "Landscape"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    allowedOrientations = Orientation.Landscape
                    lockToggle.checked = true
                }
            }
            Button
            {
                text: "Portrait Inverted"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    allowedOrientations = Orientation.PortraitInverted
                    lockToggle.checked = true
                }
            }
            Button
            {
                text: "Landscape Inverted"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    allowedOrientations = Orientation.LandscapeInverted
                    lockToggle.checked = true
                }
            }
        }
    }
}
