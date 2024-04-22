extends VehicleBody3D

var wheels: Array = [];
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,4):
		wheels.append(get_node("./Wheel_"+str(i+1)))
		print(wheels[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var wasd = Input.get_vector("Left", "Right","Backwards","Forwards")
	engine_force = wasd.y*150
	steering = deg_to_rad(wasd.x*20* -1)
	
	
	
	
	pass
