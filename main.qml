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
            opacity: 0.5
            Behavior on opacity{
                PropertyAnimation{
                    duration: 2000
                }
            }
        }
        Speedometer{
        id: speedometer
        opacity: 0.5
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
                if(tachometer.rpm == 0){
                tachometer.rpm = 500
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
            x: 500
            onButtonClicked: {
            if(tachometer.rpm < 8000 && tachometer.rpm >= 1000){
              tachometer.rpm += 1000
            }
            if(tachometer.rpm < 1000){
                tachometer.rpm = 1000
            }
            }


        }
        Button {
            buttonText: "Brake"
            backgroundColor: "red"
            anchors.bottom: parent.bottom
            x: 400
            onButtonClicked: {
                if(tachometer.rpm > 0){
                    tachometer.rpm -= 1000
                }
                if(tachometer.rpm < 1000){
                    tachometer.rpm = 500
                }
            }
        }

    }

    //Miten teen oman QML -komponentin, esim button
}
