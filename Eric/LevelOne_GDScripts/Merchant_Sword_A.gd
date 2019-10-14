extends Area2D

onready var rootNode = get_parent()
onready var routeNode = rootNode.get_node("Pre_routes/Merchant/Merchant_path_s1/Merchant_pathFollow_s1")
onready var dialogueNode = rootNode.get_node("Dialogue_controller")

export var speed = 50

var position_last
var position_current
var velocity

func _ready():
	position_last = position
	position_current = position


func _process(delta):
	
	position_current = position
	
	velocity = position_current - position_last
	
	position_last = position 
	
	if rootNode.level_stage <2:
		rootNode.current_mode = "animation"
		routeNode.offset += speed * delta
		position = routeNode.global_position
		
		var accuracy = speed * delta * 0.9
		
		if velocity.y > 0 + accuracy:
			$AnimatedSprite.animation = "Down"
		elif velocity.y < 0 - accuracy:
			$AnimatedSprite.animation = "Up"
		elif velocity.x > 0 + accuracy:
			$AnimatedSprite.animation = "Right"
		elif velocity.x < 0 - accuracy:
			$AnimatedSprite.animation = "Left"
		
		if routeNode.unit_offset >= 0.99:
			$AnimatedSprite.animation = "Right"
			$AnimatedSprite.stop()
			dialogueNode.line_playing += 1
			rootNode.level_stage = 2
		else:
			$AnimatedSprite.play()
	
	
	
