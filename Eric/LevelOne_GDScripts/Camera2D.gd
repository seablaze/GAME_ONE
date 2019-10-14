extends Camera2D

onready var rootNode = get_parent()
onready var pathNode = rootNode.get_node("Pre_routes/Camera/PathOne/FollowOne")
onready var pathNode2 = rootNode.get_node("Pre_routes/Camera/PathTwo/FollowTwo")
onready var dialogueNode = rootNode.get_node("Dialogue_controller")
onready var playerNode = rootNode.get_node("Player")
onready var merchantNode = rootNode.get_node("Merchant_Sword_A")

func _ready():
	zoom.x = position.y *2 / rootNode.screen_size.y
	zoom.y = position.y *2 / rootNode.screen_size.y
	pass

func _process(delta):
	if rootNode.level_stage < 3:
		position = pathNode.position
		
	elif rootNode.level_stage == 3:
		#if zoom.x < 0.45:
		#	zoom.x += 0.07 * delta
		#	zoom.y = zoom.x
		position = pathNode.global_position
		pathNode.offset += 250 * delta
		if pathNode.unit_offset >= 0.99:
			rootNode.level_stage = 4
			dialogueNode.line_playing += 1
			
	elif rootNode.level_stage == 5:
		position = pathNode.global_position
		pathNode.offset -= 250 * delta
		if pathNode.unit_offset <= 0.50:
			rootNode.level_stage = 6
			dialogueNode.line_playing += 1
	
	elif rootNode.level_stage == 7:
		position = pathNode2.global_position
		pathNode2.offset += 150 * delta
		if pathNode2.unit_offset >= 0.99:
			rootNode.level_stage = 8
			#dialogueNode.line_playing += 1
		if zoom.x < 1.2:
			zoom.x += 0.3 * delta
			zoom.y = zoom.x
		else:
			rootNode.level_stage = 8
	
	elif rootNode.level_stage == 9:
		var player_pos = playerNode.position
		var direction = (player_pos - position).normalized()
		var distance = (player_pos - position).length()
		var check_a = false
		var check_b = false

		if distance >= 5:
			position += direction * 150 * delta
		else:
			check_a = true

		if zoom.x > 0.45:
			zoom.x -= 0.3 * delta
			zoom.y = zoom.x
		else:
			check_b = true
		
		if check_a == true and check_b == true:
			rootNode.level_stage = 10
			dialogueNode.line_playing += 1
	
	elif rootNode.level_stage == 11:
		var merchant_pos = merchantNode.position
		var direction = (merchant_pos - position).normalized()
		var distance = (merchant_pos - position).length()
		
		if distance >= 5:
			position += direction * 150 * delta
		else:
			rootNode.level_stage = 12
			dialogueNode.line_playing += 1
			print('11 end 12 now')
	
	elif rootNode.level_stage == 13:
		var merchant_pos = playerNode.position
		var direction = (merchant_pos - position).normalized()
		var distance = (merchant_pos - position).length()
		
		if distance >= 5:
			position += direction * 150 * delta
		else:
			rootNode.level_stage = 14
			dialogueNode.line_playing += 1
			print('13 end 14 now')
			
	elif rootNode.level_stage == 15:
		var merchant_pos = merchantNode.position
		var direction = (merchant_pos - position).normalized()
		var distance = (merchant_pos - position).length()
		
		if distance >= 5:
			position += direction * 150 * delta
		else:
			rootNode.level_stage = 16
			dialogueNode.line_playing += 1
			print('15 end 16 now')
			
	elif rootNode.level_stage == 17:
		var merchant_pos = playerNode.position
		var direction = (merchant_pos - position).normalized()
		var distance = (merchant_pos - position).length()
		
		if distance >= 5:
			position += direction * 150 * delta
		else:
			rootNode.level_stage = 18
			dialogueNode.line_playing += 1
			print('17 end 18 now')
			

			
