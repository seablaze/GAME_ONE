extends Area2D

onready var rootNode = get_parent()
onready var LDlabelNode = rootNode.get_node("Background/CanvasLayer/LDLabel")
onready var LTlabelNode = rootNode.get_node("Background/CanvasLayer/LTLabel")

var can_move

signal bullet

var bullet_scene = preload("res://Bullet.tscn")
var bullet_node = bullet_scene.instance()

var speed = 150

export var bullet_num = 5


func _ready():
	pass


func _process(delta):
	
	LDlabelNode.text = "bullet left: " + str(bullet_num)

	# set velocity
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.x > 0:
		$AnimatedSprite.animation = "Right"
	elif velocity.x < 0:
		$AnimatedSprite.animation = "Left"
	elif velocity.y > 0:
		$AnimatedSprite.animation = "Down"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "Up"
	
	if rootNode.level_stage == 6:
		$AnimatedSprite.animation = "Right"
	

	
	# move
	if rootNode.allow_moving:
		velocity = velocity.normalized()*speed
		position += velocity * delta

		# play animation 
		if velocity.length() > 0:
			$AnimatedSprite.play()
		else:
			$AnimatedSprite.stop()
	
	# shoot bullet
	if rootNode.allow_fighting: 
		if Input.is_action_just_released("attack_bullet") and bullet_num>0:
			bullet_num -= 1
			var bullet_add = bullet_node.duplicate()
			$Revolver.add_child(bullet_add)
			# print("bullet")
			
			# change bullet
		if Input.is_action_just_pressed("change_bullet"):
			bullet_num = 5

	position.x = clamp(position.x, 0, rootNode.screen_size.x)
	position.y = clamp(position.y, 0, rootNode.screen_size.y)
	
	
	

