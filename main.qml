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
            opacity: 0.2
            Behavior on opacity{
                PropertyAnimation{
                    duration: 2000
                }
            }
        }
        Speedometer{
        id: speedometer
        opacity: 0.2
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
            text: "Not Running"
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
            id: startStopButton
            buttonText: "Start/\nStop"
            backgroundColor: "lightgreen"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onButtonClicked: {
                // käsitellään buttonin signaali (tämä on slot)

                if(isRunning == false){
                    motorStatusText.text = "Running"
                    if(tachometer.rpm == 0){
                    tachometer.rpm = 500
                    }
                    speedometer.opacity = 1
                    tachometer.opacity = 1
                    background.color = "darkgray"
                    isRunning = true
                    brakeButton.opacity = 1
                    gasButton.opacity = 1
                    startStopButton.backgroundColor = "red"
                }else{
                    motorStatusText.text = "Not Running"
                    tachometer.rpm = 0
                    speedometer.speed = 0
                    speedometer.opacity = 0.2
                    tachometer.opacity = 0.2
                    background.color = "black"
                    isRunning = false
                    brakeButton.opacity = 0.5
                    gasButton.opacity = 0.5
                    startStopButton.backgroundColor = "lightgreen"
                }




            }
        }
        Button{
            id: gasButton
            buttonText: "Gas"
            backgroundColor: "blue"
            anchors.bottom: parent.bottom
            opacity: 0.5
            x: 500
            onButtonClicked: {


                if(tachometer.rpm < 8000 && tachometer.rpm >= 1000){
                tachometer.rpm += 1000
                speedometer.speed += 1500
                }
                if(tachometer.rpm < 1000){
                    tachometer.rpm = 1000
                    speedometer.speed = 1000
                }
            }



        }
        Button {
            id: brakeButton
            buttonText: "Brake"
            backgroundColor: "red"
            opacity: 0.5
            anchors.bottom: parent.bottom
            x: 400
            onButtonClicked: {
                if(tachometer.rpm > 0){
                    tachometer.rpm -= 1000
                    speedometer.speed -= 1500
                }
                if(tachometer.rpm < 1000){
                    tachometer.rpm = 500
                    speedometer.speed = 0
                }
            }
        }

    }

    //Miten teen oman QML -komponentin, esim button
}
