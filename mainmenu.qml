// MainMenu.qml
 
import QtQuick 2.8
 
 
//This item represents the main menu (where user can start or quit the gamde)
Item {
 
    id: mainMenu
    width: 320
    height: 320
 
    signal started      //emitted when the start button is pressed
    signal continued    //emitted when the continue button is pressed
    signal exited       //emitted when the exit button is pressed
 
 
    //This rotation transform will allow a nice rotation effect over the x axix
    transform:  Rotation{
        id: contentRotation
        origin.x: 160;
        origin.y: 0;
        axis { x: 1; y: 0; z: 0 }
        angle: 0
    }
 
 
    //Background of the menu with some alpha blending
    Rectangle{
        width: 320
        height: 320
        color: "cornflowerblue"
        border.width: 3
        border.color: "darkblue"
        opacity: 0.8
        radius: 10
    }
 
 
    // Positions whatever amount of buttons we have in order in the screen
    Grid{
        id: grid
        rows: 3
        columns: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 15
 
 
        // Continue button showed when the game is paused, hidden by default
        Rectangle{
 
            id: continueButton
            width: 200
            height:60
            radius: 10
 
            color: "orange"
            border.width: 3
            border.color: "orangered"
 
            visible: false
 
 
            Text {
                id: continueText
                text: "Continue"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 12
                color: "white"
            }
 
            MouseArea{
                anchors.fill: parent
                onClicked: mainMenu.continued()     //When pressed the continued signal is emitted
            }
        }
 
        // Start Button presented as "Start" on the beginning or "Restart" when game is paused
        Rectangle{
 
            id: startButton
            width: 200
            height:60
 
            radius: 10
 
            color: "orange"
            border.width: 3
            border.color: "orangered"
 
            visible: false
 
 
            Text {
                id: startText
                text: "Start"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 12
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: mainMenu.started()       //emits the start signal
            }
        }
 
 
 
        // Exit button
        Rectangle{
 
            id: exitButton
            width: 200
            height:60
            radius: 10
            color: "orange"
            border.width: 3
            border.color: "orangered"
 
 
            Text {
                id: exitText
                text: "Exit"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 12
                color: "white"
            }
 
            MouseArea{
                anchors.fill: parent
                onClicked: mainMenu.exited()  //emits the exited signal
            }
        }
    }
 
 
    //-------------STATES---------------------
 
    states: [
 
        //Presented when the game is only started or it has finished
        State {
            name: "normal"
            PropertyChanges{
                target: startButton
                visible: true
            }
            PropertyChanges {
                target: startText
                text: "Start"
            }
            PropertyChanges {
                target: continueButton
                visible: false
            }
        },
 
        //Presented when the game is paused
        State {
            name: "extended"
            PropertyChanges{
                target: startButton
                visible: true
            }
 
            PropertyChanges {
                target: startText
                text: "Restart"
            }
            PropertyChanges {
                target: continueButton
                visible: true
            }
        },
 
        //Presented when the game is running
        State {
            name: "hidden"
            PropertyChanges {
                target: contentRotation
                angle: 90
            }
        }
    ]
 
 
    //-----------TRANSITIONS-----------------
 
   //Cool effects of rotation when state is changed to hidden and vice
    transitions: [
        Transition {
            from: "normal"
            to: "hidden"
            reversible: true
            NumberAnimation { target: contentRotation; property: "angle"; duration: 300 }
        },
        Transition {
            from: "extended"
            to: "hidden"
            reversible: true
            NumberAnimation { target: contentRotation; property: "angle"; duration: 300 }
        }
    ]
}