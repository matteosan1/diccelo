//Import the declarative plugins
import QtQuick 2.8

//Implementation of the Button control.
Item {
    id: button
    property alias buttonText: innerText.text
    property color buttonColor: "red"
    property color pressColor: "darkred"
    property alias textColor: innerText.color
    property int fontSize: 10
    property int borderWidth: 5
    property int borderRadius: 2
    scale: state === "Pressed" ? 0.96 : 1.0
    onEnabledChanged: state = ""
    signal clicked

    //define a scale animation
    Behavior on scale {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }

    //Rectangle to draw the button
    Rectangle {
        id: circularButton
        anchors.fill: parent
        anchors.centerIn: parent
        width: 30
        height: 30
        radius: width *0.5
        color: buttonColor
        border.width: borderWidth
        border.color: "black"

        Text {
            id: innerText
            font.pointSize: fontSize
            anchors.horizontalCenter: circularButton.horizontalCenter
            anchors.verticalCenter: circularButton.verticalCenter
            wrapMode: Text.WrapAnywhere
            color: "black"
        }
    }

    //change the color of the button in differen button states
    states: [
       State {
            name: "Pressed"
            PropertyChanges {
                target: circularButton
                color: pressColor
            }
        }
    ]

    //define transmission for the states
    transitions: [
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 10 }
        }
    ]

    //Mouse area to react on click events
    MouseArea {
        anchors.fill: button
        onClicked: { button.clicked();}
        onPressed: { button.state="Pressed" }
        onReleased: {
              button.state="";
        }
    }
}

