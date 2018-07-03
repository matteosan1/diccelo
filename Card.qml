//  Card.qml
import QtQuick 1.0
 
 
//This item represents a single card on the deck
Item {
 
    id: card
    width:75
    height:75
 
    signal selected
    property string parNumber: '0'
 
    //Cover of the card
    Image {
        id: coverImg
        source: "img/cover.PNG"
 
        // Centers the image on its own container
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
 
        //This rotation produces the effect of the card cover turning over
        transform:  Rotation{
            id: coverRotation
            origin.x: 35;
            origin.y: 35;
            axis { x: 0; y: 1; z: 0 }
            angle: 0
        }
 
    }
 
    //Content of the card
    Image {
        id: contentImg
 
        source: "img/card"+parNumber+".PNG"
 
         // Centers the image on its own container
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
 
        //this rotation produces de effect of the card content turning over and showing up
        transform:  Rotation{
            id: contentRotation
            origin.x: 35;
            origin.y: 35;
            axis { x: 0; y: 1; z: 0 }
            angle: 90
        }
    }
 
    MouseArea {
 
        id: interactiveArea
        anchors.fill: parent
        onClicked: card.selected()
    }
 
 
    //-----------STATES---------------------
 
    states: [
        //State presented when the card is flipped over
        State {
            name: "open"
            PropertyChanges {
                target: coverRotation
                angle: 90
            }
            PropertyChanges {
                target: contentRotation
                angle: 0
 
            }
        },
        //State presented when the card is removed from the deck
        State {
            name: "removed"
            PropertyChanges {
                target: contentRotation
                angle:0
 
            }
            PropertyChanges {
                target: coverImg
                visible: false
            }
 
            PropertyChanges {
                target: interactiveArea
                enabled: false
 
            PropertyChanges {
                target: contentImg
                width:0
                height:0
                rotation:360
            }
        }
    ]
 
 
    // ------------- TRANSITIONS-------------------------
 
    transitions: [
        Transition {
            from: ""
            to: "open"
            reversible: true
            //This annimation produces the effect of the card flipping over and showing the content
            SequentialAnimation{
                NumberAnimation { target: coverRotation; property: "angle"; duration: 150 }
                NumberAnimation { target: contentRotation; property: "angle"; duration: 150 }
            }
        },
        Transition {
            from: "open"
            to: "removed"
            NumberAnimation { target: contentImg; properties: "rotation,width,height"; duration: 200 }
 
        }
    ]
}