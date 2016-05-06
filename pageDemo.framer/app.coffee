# Create a PageComponent 

# 
iphone = new Layer
 	width: 640
 	height: 1280
 	backgroundColor: "rgba(253,253,253,1)"
 	opacity: 1.00
 	borderWidth: 2
 	borderColor: "rgba(167,167,167,0.5)"
 	shadowSpread: 1
 	shadowColor: "rgba(114,114,114,0.55)"

iphone.style.overflow = 'hidden'
iphone.states.add
cell = new Layer
	width: 940
	height: 100
	y:10



cellContent = new Layer
 	x: 0,
 	y: 0,
 	width: 640,
 	height: 100

cellContent.style.backgroundColor = '#eee'
cell.superLayer=iphone
cellContent.superLayer=cell
cell.draggable.enabled=true
cell.draggable.speedY=0

cell.on Events.DragEnd,->
	cell.animate
		properties:
			x:0
			time: 0.2
cellAction = new Layer
	x: 640
	y: 0
	width: 300
	height: 100
cellAction.superLayer = cell;
cellAction.style.backgroundColor = '#e00'

map_range = (value, low1, high1, low2, high2) ->
  if value < low1
    low2
  else if value > high1
    high2
  else
    low2 + (high2 - low2) * (value - low1) / (high1 - low1)
cell.on Events.DragMove,->
	cellAction.opacity=map_range(cell.x,-300,0,1,0)
	
cell.on Events.DragEnd,->
	if cell.x<-200
		cell.animate
			properties: x: -300
			time: 0.2
		cellAction.animate
			properties: opacity: 1
			time: 0.2
	else
		cell.animate
			properties: x: 0
			time: 0.2
			
		cellAction.animate
			properties: opacity: 0
			time: 0.2
cell2 = new Layer(
  x: 0
  y: 300
  width: 640
  height: 100)
cell2.style.background = '#00e'
cell2.superLayer = iphone

cell2.on Events.DragMove, ->
  if cell2.y > 500
    cell2.animate
      properties: scale: 0.1
      time: 0.2
  return

cell2.superView = iphone
cell2.draggable.enabled = true
cell2.draggable.speedX = 0
cell2.animated = false
cell2.on Events.DragMove, ->
  if !cell2.animated and cell2.y > 500
    cell2.animate
      properties: scale: 0.1
      time: 1
    cell2.animated = true
  return
cell2Content = new Layer(
  x: 0
  y: 0
  width: 640
  height: 100)
cell2Content.style.background = '#00e'
cell2Content.superLayer = cell2
cell2.on Events.DragMove, ->
  if !cell2.animated and cell2.y > 500
    cell2Content.animate
      properties: scale: 0.1
      time: 1
    cell2.animated = true
  return