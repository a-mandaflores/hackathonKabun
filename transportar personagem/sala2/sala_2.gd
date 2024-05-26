extends Area2D

#1950 1720
var _player_ref: Character = null
@export_category("Variables")
@export var _teleport_position: Vector2

@export_category("Objects")

func _ready():
	if not _teleport_position:
			_teleport_position = Vector2(-584, 1784)
		
func _on_body_entered(body):
	if body is Character:
		_player_ref = body
		_player_ref.global_position = _teleport_position
		
	

