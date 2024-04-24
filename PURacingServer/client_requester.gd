extends Node

var client = Client.new()
var roomcode = ""
var room_name = ""
var room_host = false

@rpc("authority")
func join_custom_room(code, max_players):
	if code != "" && client.state != Client.client_state.In_Game:
		print("pairing up")
		get_parent().check_codes(code, str(name))
	
	pass
	
@rpc("authority")
func create_custom_room(code, max_players):
	if code != "" && client.state != Client.client_state.In_Game:
		print("made room code")
		get_parent().create_room(code, str(name), max_players)
		roomcode = code
	create_custom_room.rpc_id(int(str(name)), code, max_players)
	update_room()
	pass

@rpc("authority", "unreliable")
func sync_position(player, movement, rotation,position, brake):
	if room_name != "":
		var room = get_parent().get_node_or_null(room_name)
		if room:
			for participant in room.participants:
				get_parent().get_node(str(participant.id)).sync_position.rpc_id(participant.id, player, movement , rotation, position, brake)
	pass

func update_room():
	var rooml = []
	var room = get_parent().get_node_or_null(room_name)
	if room:
		for participant in room.participants:
			rooml.append(participant.id)
		_update_room.rpc_id(client.id, rooml)
	pass

@rpc("authority", "reliable")
func win(index):
	if room_name != "":
		var room = get_parent().get_node_or_null(room_name)
		if room:
			for participant in room.participants:
				get_parent().get_node(str(participant.id)).sync_position.rpc_id(participant.id, index)
	pass

@rpc("authority")
func leave_room():
	get_parent().leave_room(self)
	pass

@rpc("reliable")
func _update_room(players):
	pass

@rpc("authority")
func start_game(index, plr_length):
	var curr_index = 0
	if room_host:
		var room = get_parent().get_node_or_null(room_name)
		if room:
			for participant in room.participants:
				get_parent().get_node(str(participant.id)).start_game.rpc_id(participant.id, curr_index, len(room.participants))
				curr_index += 1 
				
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
