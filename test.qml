import QtQuick 2.0 
Item {
	   width: 80 
	   height: 300
	   ListView {
	   anchors.fill: parent 
	   anchors.margins: 20
	   clip: true 
	   model: 8
	   delegate: numberDelegate
	   //spacing: 5 
       }
       Component {
        	 id: numberDelegate
		 Rectangle {
		 	   width: 40 
		 	   height: 40 
			   color: "blue"
		 	   //text: index
		 }	   
	}
}