extends Control

var multiplayerpeer = ENetMultiplayerPeer.new()
var id = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayerpeer.create_client(
		SettingsGlobal.ADRESS,
		SettingsGlobal.PORT
	)
	multiplayer.multiplayer_peer = multiplayerpeer
	print(multiplayer.get_unique_id())
	id = multiplayer.get_unique_id()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_create_pressed():
	var roomcode = $VBoxContainer/Code.text
	var maxplr = 0
	if $"VBoxContainer/Max Players".text != "":
		maxplr = int($"VBoxContainer/Max Players".text)
	else:
		maxplr = 2
	get_parent().get_node(str(id)).create_custom_room.rpc_id(1, roomcode, maxplr)
	pass # Replace with function body.


func _on_join_pressed():
	var roomcode = $VBoxContainer/Code.text
	get_parent().get_node(str(id)).join_custom_room.rpc_id(1, roomcode, 0)
	pass # Replace with function body.
