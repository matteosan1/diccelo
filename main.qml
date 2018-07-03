import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.8

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("Immagine misteriosa")
    property int m_countdown: 10

    //Image {
    //    anchors.fill: parent
    //    source: "file://Users/sani/workspace/qtquick/diccelo/vernici-punto-colore-mezzolombardo-006-1800x1200.jpg"
//62348077-Modello-moderno-di-pietra-naturale-di-mattoni-decorativo-Muro-di-texture-per-lo-sfondo-pietra-autent-Archivio-Fotografico.jpg"
    //}

    property color tileColor: "brown"

    Image {
        id:imgContact
        smooth: true
        anchors.centerIn: parent
        //width:900
        //height: 900
        source: u.fileSource
    }

    SoundEffect {
        id: playSound
        source: "qrc:/CRKYDR2.WAV"
    }

    //Text {
    //    id: punteggio
    //    text: "Punteggio: %1".arg(u.punti)
    //     font.family: "Times New Roman"
    //    font.pointSize: 45
    //    //width: textContainer.width
    //    color: "black"
    //    anchors.left:parent.left
    //}

    Text {
        id: countdown
        text: "%1  ".arg(u.countdown)
        font.family: "Times New Roman"
        font.pointSize: 45
        color: "black"
        anchors.right:parent.right
    }

    Timer {
        id: countdownTimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: u.tick()
    }

    Item {
        anchors.fill: imgContact

        Rectangle {
            id: rect1
            width: imgContact.width/2.
            height: imgContact.height/2.
            color: tileColor

            Image {
                id: img1
                anchors.fill: rect1
                source: "qrc:/index2.jpg"
            }

            //Text {
            //    id: text
            //    anchors.horizontalCenter: img1.horizontalCenter
            //    anchors.verticalCenter: img1.verticalCenter
            //    font.family: "Times New Roman"
            //    text: "1"
            //    font.pixelSize: 24
            //    font.bold: true
            //    color: "black"
            //}


            states: State {
                name: "back"
                PropertyChanges { target: rotation1; angle: -180 }
            }

            transform: Rotation {
                id:rotation1
                origin.x: 0 //rot.width
                origin.y: 0 //rot.heigth
                axis.x:0; axis.y: 1; axis.z:0
                angle: 0
            }

            transitions: Transition {
                NumberAnimation { target: rotation1; property: "angle"; duration: 1000 }
            }
        }

        Rectangle {
            id: rect2
            anchors.left: rect1.right
            width: imgContact.width/2.
            height: imgContact.height/2.
            color: tileColor

            Image {
                id: img2
                anchors.fill: rect2
                source: "qrc:/index2.jpg"
            }

            //Text {
            //    id: text2
            //    anchors.horizontalCenter: img2.horizontalCenter
            //    anchors.verticalCenter: img2.verticalCenter
            //    font.family: "Times New Roman"
            //    text: "2"
            //    font.pixelSize: 24
            //    font.bold: true
            //    color: "black"
            //}


            states: State {
                name: "back"
                PropertyChanges { target: rotation2; angle: 180 }
            }

            transform: Rotation {
                id:rotation2
                origin.x: rect2.width
                origin.y: rect2.height
                axis.x:0; axis.y: 1; axis.z:0
                angle: 0
            }

            transitions: Transition {
                NumberAnimation { target: rotation2; property: "angle"; duration: 1000 }
            }
        }

        Rectangle {
            id: rect3
            anchors.top: rect1.bottom
            width: imgContact.width/2.
            height: imgContact.height/2.
            color: tileColor

            Image {
                id: img3
                anchors.fill: rect3
                source: "qrc:/index2.jpg"
            }

            //Text {
            //    id: text3
            //    anchors.horizontalCenter: img3.horizontalCenter
            //    anchors.verticalCenter: img3.verticalCenter
            //    font.family: "Times New Roman"
            //    text: "3"
            //    font.pixelSize: 24
            //    font.bold: true
            //    color: "black"
            //}


            states: State {
                name: "back"
                PropertyChanges { target: rotation3; angle: -180 }
            }

            transform: Rotation {
                id:rotation3
                origin.x: 0 //rot.width
                origin.y: 0 //rot.heigth
                axis.x:0; axis.y: 1; axis.z:0
                angle: 0
            }

            transitions: Transition {
                NumberAnimation { target: rotation3; property: "angle"; duration: 1000 }
            }
        }

        Rectangle {
            id: rect4
            anchors.left: rect3.right
            anchors.top: rect2.bottom
            width: imgContact.width/2.
            height: imgContact.height/2.
            color: tileColor

            Image {
                id: img4
                anchors.fill: rect4
                source: "qrc:/index2.jpg"
            }

            //Text {
            //    id: text4
            //    anchors.horizontalCenter: img4.horizontalCenter
            //    anchors.verticalCenter: img4.verticalCenter
            //    font.family: "Times New Roman"
            //    text: "4"
            //    font.pixelSize: 40
            //    font.bold: true
            //    color: "white"
            //}


            states: State {
                name: "back"
                PropertyChanges { target: rotation4; angle: 180 }
            }

            transform: Rotation {
                id:rotation4
                origin.x: rect4.width
                origin.y: rect4.height
                axis.x:0; axis.y: 1; axis.z:0
                angle: 0
            }

            transitions: Transition {
                NumberAnimation { target: rotation4; property: "angle"; duration: 1000 }
            }
        }

//        Rectangle {
//            id: rect5
//            anchors.top: rect3.bottom
//            width: imgContact.width/2.
//            height: imgContact.height/3.
//            color: tileColor
//
//            Image {
//                id: img5
//                anchors.fill: rect5
//                source: "qrc:/index.jpg"
//            }
//
//            Text {
//                id: text5
//                anchors.horizontalCenter: img5.horizontalCenter
//                anchors.verticalCenter: img5.verticalCenter
//                font.family: "Times New Roman"
//                text: "5"
//                font.pixelSize: 24
//                font.bold: true
//                color: "black"
//            }
//
//
//            states: State {
//                name: "back"
//                PropertyChanges { target: rotation5; angle: -180 }
//            }
//
//            transform: Rotation {
//                id:rotation5
//                origin.x: 0 //rot.width
//                origin.y: 0 //rot.heigth
//                axis.x:0; axis.y: 1; axis.z:0
//                angle: 0
//            }
//
//            transitions: Transition {
//                NumberAnimation { target: rotation5; property: "angle"; duration: 1000 }
//            }
//        }
//
//        Rectangle {
//            id: rect6
//            anchors.top: rect4.bottom
//            anchors.left: rect5.right
//            width: imgContact.width/2.
//            height: imgContact.height/3.
//            color: tileColor
//
//            Image {
//                id: img6
//                anchors.fill: rect6
//                source: "qrc:/index.jpg"
//            }
//
//            Text {
//                id: text6
//                anchors.horizontalCenter: img6.horizontalCenter
//                anchors.verticalCenter: img6.verticalCenter
//                font.family: "Times New Roman"
//                text: "6"
//                font.pixelSize: 24
//                font.bold: true
//                color: "black"
//            }
//
//            states: [
//                State {
//                    name: "back"
//                    PropertyChanges { target: rotation6; angle: 180 }
//                },
//                State {
//                    name: "front"
//                    PropertyChanges { target: rotation6; angle: 0 }
//                }
//            ]
//
//            transform: Rotation {
//                id:rotation6
//                origin.x: rect6.width
//                origin.y: rect6.height
//                axis.x:0; axis.y: 1; axis.z:0
//                angle: 0
//            }
//
//            transitions:
//                Transition {
//                NumberAnimation { target: rotation6; property: "angle"; duration: 1000 }
//            }
//        }

        Connections {
            target: u

            onTileChanged: {
                if (rectNumber == 0) {
                    rect1.state = "back"
                }
                if (rectNumber == 1) {
                    rect2.state = "back"
                }
                if (rectNumber == 2) {
                    rect3.state = "back"
                }
                if (rectNumber == 3) {
                    rect4.state = "back"
                }
                //if (rectNumber == 4) {
                //    rect5.state = "back"
                //}
                //if (rectNumber == 5) {
                //    rect6.state = "back"
                //}

                playSound.play()
            }

            onFileSourceChanged: {
                rotation1.angle=0
                rotation2.angle=0
                rotation3.angle=0
                rotation4.angle=0
                //rotation5.angle=0
                //rotation6.angle=0
                rect1.state=""
                rect2.state=""
                rect3.state=""
                rect4.state=""
                //rect5.state=""
                //rect6.state=""
            }

            onShowAll: {
                rotation1.angle=-180
                rotation2.angle=180
                rotation3.angle=-180
                rotation4.angle=180
                //rotation5.angle=-180
                //rotation6.angle=180
            }
        }
    }

    MyButton {
        id: changePicture
        anchors.bottom: parent.bottom
        height: 80
        width: 80
        buttonText: "IMMAGINE"
        buttonColor: "darkgreen"
        pressColor: "green"
        textColor: "white"
        onClicked: {
            if (countdownTimer.running) {
                countdownTimer.stop()
            }
            u.change();
        }
    }

    MyButton {
        id: uncoverTile
        anchors.bottom: changePicture.top
        height: 80
        width: 80
        buttonText: "START/STOP"
        buttonColor: "darkblue"
        pressColor: "blue"
        textColor: "white"
        onClicked: {
            if (countdownTimer.running) {
                countdownTimer.stop()
            }
            else {
                if (u.countdown === 10)
                    u.chooseTile()
                countdownTimer.start()
            }
        }
    }

    MyButton {
        id: uncoverAllTiles
        anchors.bottom: changePicture.top
        anchors.right: parent.right
        height: 80
        width: 80
        buttonText: "SCOPRI TUTTO"
        buttonColor: "blue"
        pressColor: "lightblue"
        textColor: "white"
        onClicked: {
            u.allTiles();
            if (countdownTimer.running) {
                countdownTimer.stop()
            }
            //else {
            //   if (u.countdown == 10)
            //        u.chooseTile()
            //    countdownTimer.start()
            //}
        }
    }

    //Component.onCompleted: {
    //    mainWindow.showFullScreen();
    //}
}
