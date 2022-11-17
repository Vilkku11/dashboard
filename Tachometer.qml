import QtQuick 2.15

Rectangle {
    // Kierroslukumittarin propertyt: kierrokset
    property real rpm: 0
    Image {
        width: 500
        height: 500
        source: "tacho.png"
        Image {
            id: redNeedle
            height: parent.height * 0.37
            source: "needlered.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5* height
            rotation: -120 + rpm / 1000 * 30 // 1000 kierrosta == 30 astetta kiertoa myötäpäivään
            // Kiinnitetään neulan kierto siten, että kuvan alareuna pysyy paikoillaan kiertäessä
            transformOrigin: Item.Bottom
            Behavior on rotation{
                PropertyAnimation{
                    easing.type: Easing.InSine
                    duration: 500
                }
            }
        }
    }
}
