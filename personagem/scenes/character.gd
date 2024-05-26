extends CharacterBody2D
class_name Character

@export_category("variables")
@export var _move_speed: float = 120.0

@export var _friction: float = 0.2
@export var _acceleration: float = 0.2

@onready var animation = $AnimationTree
var _state_machine


func _ready() -> void:
	_state_machine = animation.get("parameters/playback")

func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	move_and_slide()
	

func _move() -> void: 
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down"),
	)
	
	if  _direction != Vector2.ZERO:
		animation["parameters/idle/blend_position"] = _direction
		animation["parameters/walk/blend_position"] = _direction
		
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return 
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)		
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
		
	velocity = _direction.normalized() * _move_speed
	
	
func _animate() -> void:
	if velocity.length() > 10:
		_state_machine.travel("walk")
	return
	
	_state_machine.travel("idle")
	
	
		
