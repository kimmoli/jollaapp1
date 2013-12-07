import QtQuick 2.0

Item
{
    property alias x: snowflake.x
    property alias y: snowflake.y
    property alias sxd: sfx.duration
    property alias syd: sfy.duration

    Image
    {
        id: snowflake
        source: "../pics/sc-snowflakes7.png"
        smooth: true
        property real centerX: page.width / 2
        property real centerY: page.height / 2
        property real snowflakeCenter: snowflake.width / 2
        x: centerX - snowflakeCenter
        y: centerY - snowflakeCenter

        Behavior on y
        {
            SmoothedAnimation
            {
                id: sfx
                easing.type: Easing.Linear
                duration: 100
            }
        }

        Behavior on x
        {
            SmoothedAnimation
            {
                id: sfy
                easing.type: Easing.Linear
                duration: 100
            }
        }
    }

}
