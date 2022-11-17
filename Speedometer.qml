import QtQuick 2.15

Item {

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
            transformOrigin: Item.bottom
        }
    }
}
