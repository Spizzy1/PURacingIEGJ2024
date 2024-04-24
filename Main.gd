extends Node3D

var id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@rpc("reliable")
func connect_player():
	print("Creating requester")
	var client_requester = preload("res://client_requester.tscn").instantiate()
	client_requester.name = str(multiplayer.get_unique_id())
	id = str(client_requester.name)
	add_child(client_requester)
	var UI = get_node_or_null("OnlineUI")
	if UI:
		UI.get_node("VBoxContainer").visible = true
		UI.get_node("Load").visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
