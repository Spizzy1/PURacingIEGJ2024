extends Node


@rpc("authority")
func join_custom_room(code):
	pass
	
@rpc("authority")
func create_custom_room(code, max_players):
	
	pass

@rpc("authority")
func leave_room():
	pass

@rpc("reliable")
func _update_room(players):
	pass
