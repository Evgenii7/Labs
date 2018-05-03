import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
 
ApplicationWindow {
   visible: true
   width: 280
   height: 300
   title: qsTr("Калькулятор")
   color: "whitesmoke"
 
       // Input field of the first number
       TextField {
           id: sumResult
		   width: 260; 
		   height: 30;
		   x:10
			y:10
       }
 
       Button {
	   text: qsTr ("0")
           height: 40;
           width: 50		   
			x:10
			y:50   
			
			onClicked:{
			sumResult.text+=("0")
			
			}
			
			
       }
	   Button {
	   text: qsTr ("1")
           height: 40;
           width: 50		   
			x:80
			y:50
			
			onClicked:{
           // if (calculator.is_first())
			sumResult.text+=("1")
			}
 }
       
	   Button {
	   text: qsTr ("2")
           height: 40;
           width: 50		   
			x:150
			y:50
            
			onClicked:{
			sumResult.text+=("2")
           
			}
 }
       Button {
	   text: qsTr ("3")
           height: 40;
           width: 50		   
			x:10
			y:100
			
			onClicked:{
			sumResult.text+=("3")
			}
 }
       Button {
	   text: qsTr ("4")
           height: 40;
           width: 50		   
			x:80
			y:100
			
			onClicked:{
			sumResult.text+=("4")
			}
 }

 Button {
	   text: qsTr ("5")
           height: 40;
           width: 50		   
			x:150
			y:100
			
			onClicked:{
			sumResult.text+=("5")
			}
 }
 Button {
	   text: qsTr ("6")
           height: 40;
           width: 50		   
			x:10
			y:150
			
			onClicked:{
			sumResult.text+=("6")
			}
 }
 Button {
	   text: qsTr ("7")
           height: 40;
           width: 50		   
			x:80
			y:150
			
			onClicked:{
			sumResult.text+=("7")
			}
 }
 Button {
	   text: qsTr ("8")
           height: 40;
           width: 50		   
			x:150
			y:150
			
			onClicked:{
			sumResult.text+=("8")
			}
 }
 Button {
	   text: qsTr ("9")
           height: 40;
           width: 50		   
			x:10
			y:200
			
			onClicked:{
			sumResult.text+=("9")
			}
 }
 Button {
	   text: qsTr ("+")
           height: 40;
           width: 50		   
			x:80
			y:200
            id: plus
			onClicked:{
            
				calculator.sum(sumResult.text,"+")
				sumResult.text=("")
                plus.enabled=false
                min.enabled=false
                umn.enabled=false
                del.enabled=false
			}
 }
 Button {
	   text: qsTr ("-")
           height: 40;
           width: 50		   
			x:150
			y:200
			id: min 
			onClicked:{
				calculator.sub(sumResult.text,"-")
				sumResult.text=("")
                plus.enabled=false
                min.enabled=false
                umn.enabled=false
                del.enabled=false
			}
 }
 Button {
	   text: qsTr ("*")
           height: 40;
           width: 50		   
			x:220
			y:200
            id: umn
            onClicked:{
            
				calculator.unmoj(sumResult.text,"*")
				sumResult.text=("")
                plus.enabled=false
                min.enabled=false
                umn.enabled=false
                del.enabled=false
			}
 }
 Button {
	   text: qsTr ("/")
           height: 40;
           width: 50		   
			x:220
			y:150
            id: del
            onClicked:{
            
				calculator.delen(sumResult.text,"/")
				sumResult.text=("")
                plus.enabled=false
                min.enabled=false
                umn.enabled=false
                del.enabled=false
			}
 }

 Button {
	   text: qsTr ("CE")
           height: 90;
           width: 50		   
			x:220
			y:50
			
			onClicked:{
			calculator.clear()
            sumResult.text=("")
			}
 }
 Button {
	   text: qsTr ("=")
           height: 40;
           width: 260		   
			x:10
			y:250
            
			onClicked:{
          // calculator.sub(sumResult.text)
           
            
           
			calculator.ravno(sumResult.text)
                plus.enabled=true
                min.enabled=true
                umn.enabled=true
                del.enabled=true
			}		
 }
 Connections {
       target: calculator
 
       // Sum signal handler
       onSumResult: {
            // sum was set through arguments=['sum']
           sumResult.text = sum
       }
 
       // Subtraction signal handler
       onSubResult: {
            // sub was set through arguments=['sub']
           subResult.text = sub	  
       }
				}
}