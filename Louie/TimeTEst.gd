extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var _victory = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	if (_victory):
		Engine.time_scale -= Engine.time_scale*0.01
		print(Engine.time_scale)
		if (Engine.time_scale<0.01):
			pass

	pass
