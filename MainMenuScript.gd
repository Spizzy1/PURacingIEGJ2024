extends MarginContainer

var singleplayer_scene = preload("res://LouieTestScene.tscn")
var settings_scene = preload("res://SettingsMenu.tscn")
var multiplayer_scene = preload("res://OnlineUI.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	var instance = singleplayer_scene.instantiate()
	get_parent().add_child(instance)
	queue_free()

func _on_settings_button_pressed():
	var instance = settings_scene.instantiate()
	get_parent().add_child(instance)
	queue_free()

func _on_online_button_pressed():
	var instance = multiplayer_scene.instantiate()
	get_parent().add_child(instance)
	queue_free()

func _on_exit_button_pressed():
	get_tree().quit()

