import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Indovina il Drappellone")

    Rectangle {
    	      id: rot
	      anchors.centerIn: parent
	      width:50
	      height:100
	      color: "blue"

	      property bool opened: false

	      Text {
	      	   id: text
		   text: "1"
		   color: "white"
	      }

	      transform: Rotation {
	      		 id:rotation
			 origin.x: 0 //rot.width
			 origin.y: 0 //rot.heigth
			 axis.x:0; axis.y: 1; axis.z:0
			 angle: 0
		}
		
		states: State {
		name: "back"
		PropertyChanges { target: rotation; angle: -180 }
		when: rot.opened
		}

		transitions: Transition {
			NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
			}

		//MouseArea {
		//anchors.fill: parent
		//onClicked: rot.opened = !rot.opened
		}
	}
	
}