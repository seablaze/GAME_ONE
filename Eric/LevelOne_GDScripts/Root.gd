extends Node2D

var screen_size = Vector2(1024,768)

var level_stage = 0

export var s1_moveDistance = 222

var take_input_dialogue = true
var take_input_moveNShoot = true

## playing mode
var current_mode = "animation" #animation, fight, dialogue

## input and factor specific
var allow_moving = false
var allow_fighting = false
var allow_talking = false

onready var playerNode = $Player

var player_pos_initial

func _ready():
	player_pos_initial = playerNode.position
	current_mode = "animation"
	pass

func _process(delta):
	
	if current_mode == 'fight' and playerNode.bullet_num !=0:
		$aim_ui.position = get_global_mouse_position()
		$aim_ui.show()
	else:
		$aim_ui.hide()
	
	if level_stage == 2:
		current_mode = 'dialogue'
	elif level_stage == 3:
		current_mode = 'animation'
	elif level_stage == 4:
		current_mode = 'dialogue'
	elif level_stage == 5:
		current_mode = 'animation'
	elif level_stage == 6:
		current_mode = 'dialogue'
	elif level_stage == 7:
		current_mode = 'animation'
	elif level_stage == 8:
		current_mode = 'fight'
	elif level_stage == 9:
		current_mode = 'animation'
	elif level_stage == 10:
		current_mode = 'dialogue'
	
	if current_mode == "animation":
		allow_moving = false
		allow_fighting = false
		allow_talking = false
	elif current_mode == "fight":
		allow_moving = true
		allow_fighting = true
		allow_talking = false		
	elif current_mode == "dialogue":
		allow_moving = false
		allow_fighting = false
		allow_talking = true
	else:
		print("error: no mode assign")
	
	
	if level_stage == 0:
		current_mode = "animation"
		if playerNode.position.x < player_pos_initial.x + s1_moveDistance:
			$Player.position.x += 75 *delta
			playerNode.get_node("AnimatedSprite").play()
		else:
			playerNode.get_node("AnimatedSprite").animation = "Up"
			playerNode.get_node("AnimatedSprite").stop()
			$Dialogue_controller.line_playing +=1
			level_stage = 1
	
	
		
		
	
	
	
	## DEBUG 
	if Input.is_action_just_pressed("debug_j"):
		level_stage +=1
	
	## NEXT CHAPTER
	if level_stage == 19:
		get_tree().change_scene("res://Ch2_Root.tscn")
		
		

