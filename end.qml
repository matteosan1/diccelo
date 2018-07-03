// End..qml
 
import QtQuick 2.8
 
 
// This item is shown when all the pairs have been found.
// It means you win!
Item {
 
    id: endMessage
    width: 320
    height: 320
 
    signal selected
 
    Rectangle {
        id: background
        color: "green"
        opacity: 0.8
        width: 320
        height: 320
        radius: 10
        border.width: 3
        border.color: "darkgreen"
 
    }
 
    //Once touched it sends a selected signal
    MouseArea{
        anchors.fill: parent
        onClicked: endMessage.selected()
    }
 
    Image {
        id: img
        width: 180
        height: 180
        source: "img/welldone.PNG"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
 
    }
 
    Text {
        id: name
        text: "WELL DONE!"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: img.bottom
        anchors.topMargin: 5
        color: "white"
        font.bold: true
        font.pointSize: 14
 
    }
}