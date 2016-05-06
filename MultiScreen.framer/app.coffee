myView = new Layer
	width:Screen.width
	height:Screen.height
	backgroundColor: "#fff"
myHeader=new Layer
	width: Screen.width
	height: 80
	backgroundColor: "red"	
	superLayer: myView
myView.states.add
	pushLeft:{x:-Screen.width}
	pushRight:{x:Screen.width}
	center:{x:0}

button = new Layer
	y: 1128
	x: 39
	width: 679
	height: 126
	backgroundColor: "rgba(245,0,5,1)"
	html: "NEXT"	
