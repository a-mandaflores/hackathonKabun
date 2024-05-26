extends Node

@export var server: Server

func _on_button_started():
	print('apertei')
	get_tree().change_scene_to_file("res://chosePlayers/chose_playes.tscn")
	
