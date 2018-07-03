import QtQuick 2.8
 
Rectangle {
    id: game
    width: 640
    height: 360
  
    property int miliseconds    //miliseconds elapsed on the game
 
    //Text indicating the elapsed time on the right of clock image
    Text{
        id: elapsedTimeText
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: crono.right
        anchors.leftMargin: 5 
    }
  
    //Background where all the cards are located
    Rectangle{
        id: background
        width: 600
        height: 300
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 40
        anchors.leftMargin: 20
        color: "#6F0564"
        radius: 5
 
    }
 
    //Pause Function.  Only appears when the game is running
    Image{
        id:pause
        source: "img/pause.PNG"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
        MouseArea{
            anchors.fill: parent
            onClicked: game.state = "paused"
        }
    }
 
 
    //Deck holding the 32 cards
    Grid{
        id: deck
        rows: 4
        columns: 8
 
        anchors.top: background.top
        anchors.left: background.left
 
        //Repeater will let us arrange the 32 cards easily
        Repeater{
            model: 32
 
            //When the selected signal is emited, the openCard method is called
            //and the index is passed as argument
            Card{onSelected: openCard(index)}
        }
    }
 
 
    //When two cards are open, this timer is enabled to close them in 1 second
    Timer{
        id:closeTimer
        interval: 1000
        onTriggered: validatePar()
    }
 
    //This timer is triggered every second to keep the timer on the top-left running
    Timer{
        id:elapsedTimer
        interval: 1000
        running: false
        onTriggered: calculateElapsedTime()
        repeat: true
 
    }
 
    //Screen presented when the game is complete, not visible by default
    End{
        id: endScreen
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        onSelected: game.state=""       //Move to initial state with mainMenu
    }
 
 
    //Has the main options of the game, start/quit/about/scores
    MainMenu{
        id: mainMenu
        state: "normal"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onStarted: startGame()
        onContinued: game.state = "running"
        onExited: Qt.quit()
    }
 
 
   //------------  Javascript Functions -----------------------
 
    //Init all Variables
    function init(){
        card1=-1
        card2=-1
        parCount=0
        miliseconds=0
        remaining=16
    }
 
 
    //Starts the Game from the beginning
    function startGame(){
 
        init()                              //init variables
 
        //puts all the cards on its initial state
        for(var i=0;i<32;i++){
            deck.children[i].state=""
        }
 
        randomizeCards()
 
        game.state="running"
    }
 
 
    //Randomize the cards on the deck
    function randomizeCards(){
 
        var sortedArray = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16']
 
        var date = new Date()
        var mils = date.getMilliseconds()       //Use miliseconds avoids the same random secuece generation among calls
 
        for(var i=0;i<32;i++){
            var located = false
            while(!located){
                var randomnumber = Math.floor((Math.random()*mils)%32)
 
                var content= sortedArray[randomnumber]
                if(content !=''){  //if field is already empty, try again
                    deck.children[i].parNumber = content
                    sortedArray[randomnumber]=''
                    located=true;               //go for the next iteration
                }
            }
        }
 
    }
 
 
    //This function is triggered when a card is selected
    function openCard(index){
 
        //Changes the state of the card to open
        deck.children[index].state = "open"
 
        //Storages the index of the card in one of the two placeholders card1 or card2
        if(card1==-1){
            card1=index
        }
        else{
 
            if(index== card1) return  //return if its the same card selected
 
            card2=index
            deck.enabled = false    //disables the deck while the pair is closed
            closeTimer.start()      //closeTimer is enabled and will close the cards in one second
        }
    }
 
    //Validate if the two open cards match or not
    function validatePar(){
 
 
        var parNumber1 = deck.children[card1].parNumber
        var parNumber2 = deck.children[card2].parNumber
        var state = ""
 
        //If cards are equal they are removed
        if(parNumber1==parNumber2){
            state = "removed"
            remaining--     //one less card to find
        }
 
        deck.children[card1].state = state
        deck.children[card2].state = state
 
        //restablish initial values
        card1 = -1
        card2 = -1
        deck.enabled = true
        parCount++
 
 
        //If no remaining pairs, end of the game
        if(remaining==0){
        game.state="finished"
        }
    }
 
 
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
 
 
 
// --------Game States ---------------------------
 
//  Different game states during its life.
 
//  The default state  "" indicates a stopped state showing the mainMenu
 
   states: [
 
       //Indicates the game is running
       State {
           name: "running"
           PropertyChanges {
               target: elapsedTimer
               running: true
 
           }
           PropertyChanges {
               target: endScreen
               visible: false
           }
 
           PropertyChanges {
               target: deck         //All the cards are enabled
               enabled: true
           }
           PropertyChanges {
               target: mainMenu
               state: "hidden"
 
           }
           PropertyChanges {
               target: pause        //pause image is shown
               visible: true
           }
       },
 
       //  Paused state showing the mainMenu with extended options
       State {
           name: "paused"
           PropertyChanges {
               target: elapsedTimer
               running: false
           }
           PropertyChanges {
               target: deck
               enabled: false
           }
           PropertyChanges{
               target: pause
               visible:false
           }
           PropertyChanges {
               target: mainMenu
               state: "extended"
           }
       },
 
       // Shows the game has reached its end and "Well Done" message is displayed
       State {
           name: "finished"
           PropertyChanges {
               target: elapsedTimer
               running: false
           }
           PropertyChanges {
               target: deck
               enabled: false
           }
           PropertyChanges {
               target: endScreen
               visible: true
           }
           PropertyChanges {
               target: mainMenu
               state: "hidden"
           }
       }
   ]
 
}