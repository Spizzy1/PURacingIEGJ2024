extends Node


@rpc("authority", "call_remote", "reliable")
func join_custom_room(code):
	var roomui = get_parent().get_node_or_null("RoomUI")
	if roomui:
		roomui.queue_free()
	var scene = preload("res://RoomUI.tscn")
	var instance = scene.instantiate()
	
	pass
	
@rpc("authority", "call_remote", "reliable")
func create_custom_room(code, max_players):
	pass

@rpc("authority", "call_remote", "reliable")
func leave_room():
	pass

@rpc("authority", "call_remote", "reliable")
func _update_room(players):
	pass

@rpc("authority", "call_remote", "reliable")
func start_game(code):
	pass
