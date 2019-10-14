extends Sprite

onready var fillNode = $ui_redCircle

var fillRatio = 0 #fill ratio is from 0-1
var x=-3.14/2

func _ready():
	pass 


func _process(delta):
	if Input.is_action_pressed("attack_bullet"):
		x+= delta *3 + delta * int(fillRatio>0.9)
	elif Input.is_action_just_released("attack_bullet"):
		fillRatio = (sin(x)+1)/2
	else:
		x=-3.14/2

		
	fillRatio = (sin(x)+1)/2
	
	print(fillRatio)
	
	if fillRatio <= 0.1:
		fillNode.hide()
	else:
		fillNode.scale.x = fillRatio * 0.7 
		fillNode.scale.y = fillNode.scale.x
		fillNode.show()
