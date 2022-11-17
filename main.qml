import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1000
    height: 500
    visible: true
    title: qsTr("Qt/QML teht 2 William Reima")
    // Rakennetaan tausta
    Rectangle{
        id: background
        anchors.fill: parent
        color: "black"

        Tachometer{
            id: tachometer
            rpm: 0
            opacity: 0
            Behavior on opacity{
                PropertyAnimation{
                    duration: 2000
                }
            }
        }
        Speedometer{
        id: speedometer
        opacity: 0
        x:500 // aloitetaan 500 pikseliä ruudun vasemmasta reunasta
        Behavior on opacity{
            PropertyAnimation{
                duration: 2000
            }
        }
        }



        Text{
            id: motorStatusText
            color: "white"
            text: "Sammutettu"
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Behavior on y { // Määritlelään, miten y.n muutos "käyttäytyy"
                PropertyAnimation {
                    duration: 2000
                }
            }


        }




        // Sijoitetaan oma nappula ruudulle
        Button{
            buttonText: "Start/\nStop"
            backgroundColor: "lightgreen"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onButtonClicked: {
                // käsitellään buttonin signaali (tämä on slot)
                motorStatusText.text = "Käynnistetty"
                if(tachometer.rpm < 8000){
                tachometer.rpm += 1000
                }else{
                    tachometer.rpm = 1000
                }
                speedometer.opacity = 1
                tachometer.opacity = 1
                background.color = "gray"
            }
        }
        Button{
            buttonText: "Gas"
            backgroundColor: "blue"
            anchors.bottom: parent.bottom

        }

    }

    //Miten teen oman QML -komponentin, esim button
}
