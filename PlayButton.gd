extends Control


# Called when the node enters the scene tree for the first time.
func _ready():

	var button = Button.new()
	button.text = "Play Game"
	button.pressed.connect(self._button_pressed)
	add_child(button)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _button_pressed():
	print("play game")
	get_tree().change_scene_to_file("res://LouieTestScene.tscn")


