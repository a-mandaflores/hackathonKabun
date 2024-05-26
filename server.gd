extends Node
class_name Server

@export var Address = "127.0.0.1"
@export var port = 8910
# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.server_disconected.connect(server_disconected)
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)


func join_server():
	var client = ENetMultiplayerPeer.new()
	var err = client.create_client(Address, port)
	if err != OK:
		print("unable_to_connect")
		return
	#client.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	print("conectado")
	#multiplayer.set_multiplayer_peer(peer)
	
func connected_to_server():
	print("Connected to server")
	
func server_disconected():
	print("Server disconnected")
	
func connection_failed():
	print("Connected failed")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
