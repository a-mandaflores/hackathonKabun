extends Control

var messages = [
	"Olá e bem-vindas ao LovePlace!",
	"Estou aqui para acompanhar vocês nesta incrível jornada.",
	"LovePlace é um espaço seguro e acolhedor, criado especialmente para que mulheres",
	"possam explorar o fascinante mundo dos games,",
	"aprender novas habilidades e se desafiarem",
	"de maneiras divertidas e inspiradoras."
]

var typing_speed = 0.05
var read_time = 1

var current_message = 0
var display = ""
var current_char = 0

func _ready():
	start_dialogue()

func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	$next_char.set_wait_time(typing_speed)
	$next_char.start()
	_on_next_char_timeout()

func stop_dialogue():
	get_tree().change_scene_to_file("res://game/scenes/game.tscn")

func _on_next_char_timeout():
	
	if current_char < len(messages[current_message]):
		var next_char = messages[current_message][current_char]
		display += next_char
		
		$Label.text = display
		current_char += 1
	else:
		$next_char.stop()
		$next_message.one_shot = true
		$next_message.set_wait_time(read_time)
		$next_message.start()
		
func _on_next_messagem_timeout():
	if current_message == len(messages) - 1:
		stop_dialogue()
	else:
		current_message += 1
		display = ""
		current_char = 0
		$next_char.start()

func _process(delta):
	match Game.PlayerSelect:
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







func _on_pular_button_button_down():
	stop_dialogue()
