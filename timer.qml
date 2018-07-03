//Text indicating the elapsed time on the right of the screen
    Text{
        id: elapsedTimeText
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: crono.right
        anchors.leftMargin: 5
 
    }
 
  //This timer is triggered every second to keep the timer on the top-left running.  It is started manually when the game begins using the start() function
    Timer{
        id:elapsedTimer
        interval: 1000
        running: false
        onTriggered: calculateElapsedTime()
        repeat: true
 
//--- Javascript code ---
 
 
    //This function shows the timer on the upper-left side of the screen
    function calculateElapsedTime(){
 
        miliseconds+=1000   //Since we use a timer with 1000 mseconds we add this time to the counter
 
        var date = new Date(miliseconds)
 
        //Arrange the format
 
        var seg = date.getUTCSeconds()
        seg = seg >9 ? seg : '0'+seg
 
        var mins = date.getUTCMinutes()
        mins = mins>9 ? mins : '0'+mins
 
        //Display the elapsed time
        elapsedTimeText.text = mins+":"+seg
 
    }
 
    }