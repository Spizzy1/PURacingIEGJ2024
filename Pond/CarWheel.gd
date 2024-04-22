extends VehicleWheel3D


var car_body: VehicleBody3D
# Called when the node enters the scene tree for the first time.
func _ready():
	car_body = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	engine_force = car_body.engine_force;
	if use_as_steering:
		steering = car_body.steering;
	pass
