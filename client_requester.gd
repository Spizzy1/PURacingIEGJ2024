extends Node

var maxplr = 0
var has_won = false

@rpc("authority")
func win(index):
	if not has_won:
		pass
	has_won = true
	var winscreen_scene = preload("res://Isak/winscreen.tscn")
	var instance = winscreen_scene.instantiate()
	if get_parent().get_node(str(index)).is_main:
		instance.get_node("CanvasLayer/Label").text = "YOU WIN!!!"
	else:
		instance.get_node("CanvasLayer/Label").text = "YOU LOOOOOOOSEEE!!!"
	get_parent().add_child(instance)
	pass

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

@rpc("any_peer", "call_remote", "unreliable", 1)
func sync_position(player, movement, rotation,position, brake):
	var node = get_parent().get_node_or_null(str(player))
	
	if node && not node.is_main:
		node.position = position
		node.wasd = movement
		node.isbreak = brake
		node.rotation = rotation
	
	pass

@rpc("authority", "call_remote", "reliable")
func _update_room(players):
	print("Updating")
	var player_list = get_parent().get_node_or_null("RoomUI/VBoxContainer/VBoxContainer")
	if player_list:
		player_list.get_child(0).text = str(len(players)) + "/" + str(maxplr)
	pass

@rpc("authority", "call_remote", "reliable")
func start_game(index, plr_length):
	var Room = get_parent().get_node_or_null("RoomUI")
	if Room:
		Room.queue_free()
	var scene = preload("res://Isak/MultiplayerTest.tscn")
	var instance = scene.instantiate()
	get_parent().add_child(instance)
	var startpos = Vector3(-14.923, 2.138, 44.615)
	for i in range(plr_length):
		var car = preload("res://Scenes/Prefabs/vehicle_body.tscn")
		var car_instance = car.instantiate()
		get_parent().add_child(car_instance)
		car_instance.name = str(i)
		car_instance.rotation = Vector3(0,PI/2, 0)
		car_instance.position = startpos + (i*Vector3(0,0,2))
		if i != index:
			car_instance.is_main = false
	var cam : Camera3D = get_parent().get_node(str(index)).get_node("Camera Controller").get_node("Camera3D") 
	cam.make_current()
	
	pass
