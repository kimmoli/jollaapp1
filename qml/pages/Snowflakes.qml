import QtQuick 2.0
import Sailfish.Silica 1.0
import QtSensors 5.0 as Sensors

// Snowflake picture courtesy of http://graphicssoft.about.com/od/freedownloads/l/blfreepng05.htm

Page {
    id: page

    property int i:0

    Sensors.Accelerometer
    {
        id: accel
        dataRate: 100
        active:true

        onReadingChanged:
        {

                var thisflake = snowflake.itemAt(i)
                var newX = (thisflake.x + calcRoll(accel.reading.x, accel.reading.y, accel.reading.z) * thisflake.scale + (randomNumber(0,50)-25))
                var newY = (thisflake.y - calcPitch(accel.reading.x, accel.reading.y, accel.reading.z) * thisflake.scale + (randomNumber(0,50)-25))

                if (newX < 0)
                    newX = 0

                if (newX > page.width - thisflake.width)
                    newX = page.width - thisflake.width

                if (newY < 18)
                    newY = 18

                if (newY > page.height - thisflake.height)
                    newY = page.height - thisflake.height

                    thisflake.x = newX
                    thisflake.y = newY

                i = i + 1
                if (i == 10)
                    i = 0
        }
    }


    function randomNumber(from, to)
    {
       return Math.floor(Math.random() * (to - from + 1) + from);
    }

    function calcPitch(x,y,z)
    {
        return -(Math.atan(y / Math.sqrt(x * x + z * z)) * 57.2957795);
    }

    function calcRoll(x,y,z)
    {
         return -(Math.atan(x / Math.sqrt(y * y + z * z)) * 57.2957795);
    }

    Repeater
    {
       id: snowflake
       model: 10

        Image
        {
            id: sfi
            source: "../pics/sc-snowflakes7.png"
            smooth: true
            property real centerX: page.width / 2
            property real centerY: page.height / 2
            property real snowflakeCenter: sfi.width / 2
            x: centerX - snowflakeCenter
            y: centerY - snowflakeCenter
            property int sz: randomNumber(5,20)
            scale: sz/10
            z: 20-sz

            property int animduration: 100


            Behavior on y
            {
                //SmoothedAnimation
                NumberAnimation
                {

                    easing.type: Easing.Linear
                    duration: 300 //parent.animduration
                }
            }

            Behavior on x
            {
                //SmoothedAnimation
                NumberAnimation
                {

                    easing.type: Easing.Linear
                    duration: 300 //parent.animduration
                }
            }
        }
    }
}
