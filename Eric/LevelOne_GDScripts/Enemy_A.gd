extends Area2D


var speed 
var direction = Vector2(0,0)
var position_original
var path_distance = 200

onready var managerNode = get_parent()
onready var rootNode = managerNode.get_parent()
onready var playerNode = rootNode.get_node("Player")
onready var revolverNode = playerNode.get_node("Revolver")

var can_move


var blood = 10

func _ready():
	add_to_group("L1_allCharacters")
	randomize()
	while(direction.length()==0):
		direction.x = randi() % 3 -1
		direction.y = randi() % 3 -1
	speed = 50 + randi() % 50
	position_original = position
	


func _process(delta):
	

	
	if rootNode.allow_moving:
		position += speed * direction * delta
	
	if (position_original - position).length() > path_distance: 
		direction = - direction
	
	if direction.x > 0:
		$AnimatedSprite.animation = "Right"
	elif direction.x < 0:
		$AnimatedSprite.animation = "Left"
	elif direction.y > 0:
		$AnimatedSprite.animation = "Down"
	elif direction.y < 0:
		$AnimatedSprite.animation = "Up"
	
	if rootNode.level_stage <=5:
		$AnimatedSprite.animation = "Left"
	
	if direction.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	if blood <= 0:
		queue_free()
	for i in range(revolverNode.get_child_count()):
		if overlaps_area(revolverNode.get_child(i)):
			blood -= 5
			revolverNode.get_child(i).queue_free()
	
	
	




