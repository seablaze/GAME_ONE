extends Area2D

onready var revolverNode = get_parent()
onready var playerNode = revolverNode.get_parent()
onready var rootNode = playerNode.get_parent()
onready var aimNode = rootNode.get_node("aim_ui")
#onready var enemylistNode = rootNode.get_node(Initial_Enemies)

var direction = Vector2(0,0)
var speed = 600
var power = 1

func _ready():
	position = playerNode.position
	direction = (get_global_mouse_position() - global_position).normalized()
	global_rotation = atan2(direction.y, direction.x)
	power = aimNode.fillRatio
	print('bullet  ',power)

func _process(delta):
	position += direction * speed * delta
