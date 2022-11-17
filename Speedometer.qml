import QtQuick 2.15

Item {
    property real speed: 0
    Image {
       width: 500
       height: 500
        source: "speedo.png"
        Image {
            id: orangeNeedle
            height: parent.height * 0.37
            source: "needleorange.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5* height
            rotation: -139 + speed / 1000 * 22
            transformOrigin: Item.Bottom
            Behavior on rotation {
                PropertyAnimation{
                easing.type: Easing.InSine
                duration: 500
            }
            }
        }
    }
}
