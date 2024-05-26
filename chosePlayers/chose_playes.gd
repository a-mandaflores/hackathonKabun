extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match  Game.PlayerSelect:
		0:
			get_node("PlayerSelect").play("play0")
		1:
			get_node("PlayerSelect").play("play1")
		2:
			get_node("PlayerSelect").play("play2")
		3:
			get_node("PlayerSelect").play("play3")	
		4:
			get_node("PlayerSelect").play("play4")
		5:
			get_node("PlayerSelect").play("play5")
		6:
			get_node("PlayerSelect").play("play6")
		7:
			get_node("PlayerSelect").play("play7")
		8:
			get_node("PlayerSelect").play("play8")


func _on_left_button_down():
	if Game.PlayerSelect == 0:
		Game.PlayerSelect = 8
		return
		
	Game.PlayerSelect -= 1
	


func _on_right_button_down():
	if Game.PlayerSelect == 8:
		Game.PlayerSelect = 0
		return
	Game.PlayerSelect += 1
		


func _on_start_button_down():
	get_tree().change_scene_to_file("res://speak/scenes/messagem.tscn")
