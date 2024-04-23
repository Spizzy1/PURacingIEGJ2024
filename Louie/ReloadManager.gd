extends Node3D




var first_timer = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# TA BORT I MULTIPLAYER, BARA FÖR TIME TRIAL!!!!!!!!!!!
func _input(event):
	if first_timer && event.is_pressed():
		get_parent().get_node("CanvasLayer/Timer/Tracker").reset()
		first_timer=false
	
	if event.is_action_pressed("Reset"):
		print("actionpressed")
		get_tree().reload_current_scene()

