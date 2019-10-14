extends Node

onready var rootNode = get_parent()

func _process(delta):
	if get_child_count() == 0:
		print("end")
		rootNode.level_stage = 9
		self.queue_free()


