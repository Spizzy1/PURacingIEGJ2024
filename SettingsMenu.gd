extends MarginContainer

var singleplayer_scene = preload("res://MainMenuScene.tscn")
var networking_scene = preload("res://Networking-Settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_networking_pressed():
	var instance = networking_scene.instantiate()
	get_node("HBoxContainer").add_child(instance)
	pass # Replace with function body.


func _on_back_pressed():
	var instance = singleplayer_scene.instantiate()
	get_parent().add_child(instance)
	queue_free()
	pass # Replace with function body.
