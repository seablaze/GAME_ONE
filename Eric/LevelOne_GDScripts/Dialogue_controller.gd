extends Node

onready var rootNode = get_parent()

# PLAYER
onready var playerDialogueNode = rootNode.get_node("Player/Dialogue_bubble")
onready var playerDialogueLabel = rootNode.get_node("Player/Dialogue_bubble/Label")
#var player_speaking = false

# MERCHANT A
onready var merSADialogueNode = rootNode.get_node("Merchant_Sword_A/Dialogue_bubble")
onready var merSADialogueLabel = rootNode.get_node("Merchant_Sword_A/Dialogue_bubble/Label")
#var merSA_speaking = false

# ENEMY A
onready var enADialogueNode = rootNode.get_node("Initial_Enemies/En_A/Dialogue_bubble")
onready var enADialogueLabel = rootNode.get_node("Initial_Enemies/En_A/Dialogue_bubble/Label")
#var enA_speaking = false

# ENEMY B
onready var enBDialogueNode = rootNode.get_node("Initial_Enemies/En_B/Dialogue_bubble")
onready var enBDialogueLabel = rootNode.get_node("Initial_Enemies/En_B/Dialogue_bubble/Label")
#var enB_speaking = false

var line_playing = 0
var line_total

var convo_list = []

func _ready():
	convo_list.append("!") #0
	
	# PLAYER
	convo_list.append("Me: Wow what a nice dart set!")
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: I know right!")
	convo_list.append("Merchant: It's made by the Dart Master of SHENZHEN") 
	
	# PLAYER
	convo_list.append("Me: AHH! That explains the name: Shendart") 
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: It's light weight and super sharp on the side!")
	convo_list.append("Merchant: Tell your husband he is totally welcomed to come try it.")
	
	# PLAYER
	convo_list.append("Me: Wait what do you mean my husband?") 
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: Like if he wants to buy it, come see it in person would help him make the decision.")
	convo_list.append("Merchant: And better know how amazing this sword is, comparing to sending u here.")
	convo_list.append("Merchant: And I promise he won't be disappointed.")
		
	# PLAYER
	convo_list.append("Me: Haha no I'm not married yet, just looking for some new gears for myself.")
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: Wait wait...")
	convo_list.append("Merchant: You still not married yet?")
	convo_list.append("Merchant: Wait then what you need a dart set for?")
	
	# PLAYER
	convo_list.append("Me: ......")
	convo_list.append("Me: (Ughhh... It's the only sword shop in 10miles, kinda have to stuck with it)")
	convo_list.append("Me: Yea it's for my boss.")
	convo_list.append("Me: You know what just let me buy this, kinda in a hurry.")
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: NICE! Tell your master left click to shoot, and right click to reload!")
	
	# scene control
	convo_list.append("Break:")
	
	#ENEMY A
	convo_list.append("??: HEY YOU!")
	convo_list.append("?!: FREEZE! ")
	convo_list.append("??: LEAVE ALL YOUR MONEY OR DIE!")
	
	# scene control
	convo_list.append("Break:")
	
	# PLAYER
	convo_list.append("Me: WHAT")
	convo_list.append("Me: NO FKing WAY")
	
	# scene control
	convo_list.append("Break:")
	
	# PLAYER
	convo_list.append("Me: Oooof what was that?")
	convo_list.append("Me: Why would they even come after me? A woman?")
	
	# scene control
	convo_list.append("Break:")
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: What just happened...")

	# scene control
	convo_list.append("Break:")
	
	# PLAYER
	convo_list.append("Me: I just saved our life!!!")

	# scene control
	convo_list.append("Break:")
	
	# MERCHANT SWORD A
	convo_list.append("Merchant: ...")
	convo_list.append("Merchant: Weird")
	
	# scene control
	convo_list.append("Break:")
	
	# PLAYER
	convo_list.append("Me: ......")
	convo_list.append("Me: What a day...")
	convo_list.append("Me: Imma just head home...")
	
	# scene control
	convo_list.append("Break:")
	

	
	
	# dialogue info
	line_total = len(convo_list)
	
	

func _process(delta):
	
	if rootNode.allow_talking:
		if Input.is_action_just_pressed("dialogue_progress"):
			if line_playing == line_total -1:
				playerDialogueNode.queue_free()
				merSADialogueNode.queue_free()
				enADialogueNode.queue_free()
				enBDialogueNode.queue_free()
				self.queue_free()
			elif convo_list[line_playing+1].split(":",false,1)[0] == 'Break':
				line_playing += 1
				rootNode.level_stage += 1
				print('yes')
			else:
				line_playing += 1

	if not rootNode.allow_fighting:
		playerDialogueLabel.text = convo_list[line_playing]
		merSADialogueLabel.text = convo_list[line_playing]
		if rootNode.level_stage < 8:
			enADialogueLabel.text = convo_list[line_playing]
			enBDialogueLabel.text = convo_list[line_playing]
	
##################################################
		if convo_list[line_playing].split(":",false,1)[0] == "Me":
			playerDialogueNode.show()
		else:
			playerDialogueNode.hide()
		
		if convo_list[line_playing].split(":",false,1)[0] == "Merchant":
			merSADialogueNode.show()
		else:
			merSADialogueNode.hide()
		
		if rootNode.level_stage < 8:
			if convo_list[line_playing].split(":",false,1)[0] == "??":
				enADialogueNode.show()
			else:
				enADialogueNode.hide()
			
			if convo_list[line_playing].split(":",false,1)[0] == "?!":
				enBDialogueNode.show()
			else:
				enBDialogueNode.hide()


