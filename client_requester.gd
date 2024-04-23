extends Node

var maxplr = 0

@rpc("authority", "call_remote", "reliable")
func join_custom_room(code, max_players):
	var onlineui = get_parent().get_node_or_null("OnlineUI")
	if onlineui:
		onlineui.queue_free()
	maxplr = max_players
	print("Joining room")
	var scene = preload("res://RoomUI.tscn")
	var instance = scene.instantiate()
	get_parent().add_child(instance)

	pass
	
@rpc("authority", "call_remote", "reliable")
func create_custom_room(code, max_players):
	print("test")
	var onlineui = get_parent().get_node_or_null("OnlineUI")
	if onlineui:
		onlineui.queue_free()
	maxplr = max_players
	var scene = preload("res://RoomUI.tscn")
	var instance = scene.instantiate()
	get_parent().add_child(instance)
	pass

@rpc("authority", "call_remote", "reliable")
func leave_room():
	pass

@rpc("authority", "unreliable")
func sync_position(player, movement,position, brake):
	pass

@rpc("authority", "call_remote", "reliable")
func _update_room(players):
	print("Updating")
	var player_list = get_parent().get_node_or_null("RoomUI/VBoxContainer/VBoxContainer")
	if player_list:
		player_list.get_child(0).text = str(len(players)) + "/" + str(maxplr)
	pass

@rpc("authority", "call_remote", "reliable")
func start_game(code):
	pass
