extends Node

var client = Client.new()
var roomcode = ""
var room_name = ""


@rpc("authority")
func join_custom_room(code):
	if code != "" && client.state != Client.client_state.In_Game:
		print("pairing up")
		get_parent().check_codes(code, str(name))
	pass
	
@rpc("authority")
func create_custom_room(code, max_players):
	if code != "" && client.state != Client.client_state.In_Game:
		print("made room code")
		roomcode = code
	pass

func update_room():
	var rooml = []
	for participant in get_parent().get_node(room_name).participants:
		rooml.append(participant.client.id)
	_update_room.rpc_id(client.id)
	pass

@rpc("authority")
func leave_room():
	get_parent().leave_room(str(name))
	pass

@rpc("reliable")
func _update_room(players):
	pass

@rpc("authority")
func start_game(code):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
