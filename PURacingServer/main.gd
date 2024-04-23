extends Node

var connected = []
var clients = []
var rooms = []
var rooms_created = 0
var multiplayerpeer = ENetMultiplayerPeer.new()

@rpc("any_peer")
func connect_player():
	print("Hello from the client!")
	pass

func _ready():
	#Initializes server
	multiplayerpeer.create_server(
		4576,
		48
	)
	
	#Starts thread for reading commands
	
	#Sets the multiplayer peer
	multiplayer.multiplayer_peer = multiplayerpeer
	
	#Function for when peer connects
	multiplayerpeer.peer_connected.connect(
		func(new_peer_id):
			#Timer since there is sometimes buffer time between connecting and recieving RPC calls
			await get_tree().create_timer(1).timeout
			print("%s connected" % new_peer_id)
			
			add_client_requester(new_peer_id)
			
			#Tells player to create its own version of the client requester
			connect_player.rpc_id(new_peer_id)
			
	)
	
	#Function for when peer disconnects
	multiplayerpeer.peer_disconnected.connect(
		func(peer):
			print("%s disconnected" % peer)
			
			#Removes the peer from the connected list
			if(peer in connected):
				connected.erase(peer)
			if(get_node(str(peer))):
				#Finds the requester (it always has the same name as the peer ID)
				var requester = get_node(str(peer))
				
				#Finds all rooms with the peer inside them and dismisses them
				var close_rooms = rooms.filter(func(item): return requester.client.id in item.participants.map(func(participant): return participant.id))
				for n in len(close_rooms):
					var room = close_rooms.pop_front()
					dismiss_room(room)
				requester.queue_free()
			
			clients = clients.filter(func(item): item.client.id != peer)
		
	)
	pass

func add_client_requester(id):
	#Adds the ID to the connected string (used for management)
	connected.append(id)
	
	#Instantiates the client requester
	var client_requester = preload("res://client_requester.tscn").instantiate()
	
	#Sets the multiplayer authority (the node is created to create an isolated enviourment in control by the client for safety reasons(
	client_requester.set_multiplayer_authority(id)
	
	client_requester.name = str(id)
	client_requester.client.id = id
	client_requester.client.state = Client.client_state.Idle
	clients.append(client_requester)
	
	add_child(client_requester)
	pass

func dismiss_room(room : Room):
	
	#Finds all the participants in the game match and iterates over them to turn them back into normal clients (also updating their status)
	var temp_participants = Array(room.participants)
	for player in temp_participants:
		var p = Client.new()
		p.id = player.id
		
		p.state = Client.client_state.Idle
		if get_node(str(player.id)):
			print("overwriting connector client %s" % str(player.id))
			var connector = get_node(str(player.id))
			connector.client = p
			connector.room_name = ""
			
		room.participants.erase(player)
	
	#Removes the room from the room list
	if room in rooms:
		rooms.erase(room)
	print("dismissed a room")
	
	#Removes the room from the scene tree
	room.queue_free()
	pass



func check_codes(code, id):
	for room : Room in rooms:
		if room.code == code:
			join_room(rooms, get_node(id))
	pass


func join_room(room : Room, connector):
	room.participants.append(connector)
	for participant in room.participants:
		participant.update_room()
	pass

func leave_room(room : Room, connector):
	room.participants.erase(connector)
	for participant in room.participants:
		participant.update_room()
	pass

func create_room(code, id):
	for room : Room in rooms:
		if room.code == code:
			return 1
	var room = Room.new()
	room.id = int(str(id) + str(rooms_created))
	rooms_created += 1
	room.participants.append(get_node(id))
	room.name = str(room.id)
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
