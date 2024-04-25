extends VehicleWheel3D


var car_body: VehicleBody3D

@export
var steering_multiplier:float = 1

@export
var used_for_driving: bool = true

@export
var canBreak: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	car_body = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	steering = lerp(steering, (car_body.steering * steering_multiplier), delta*1000)
	steering = car_body.steering * steering_multiplier
	if canBreak:
		brake = car_body.brake
	if used_for_driving:
		engine_force = car_body.engine_force;
	pass
