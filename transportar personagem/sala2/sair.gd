extends Area2D

var _player_ref: Character = null
@export_category("Variables")
@export var _teleport_position: Vector2

@export_category("Objects")

func _ready():
	if not _teleport_position:
			_teleport_position = Vector2(256, 216)


func _on_body_entered(_body):
	if _body is Character:
		_player_ref = _body
		_player_ref.global_position = _teleport_position
