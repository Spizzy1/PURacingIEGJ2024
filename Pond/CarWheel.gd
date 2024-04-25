extends VehicleWheel3D


var car_body: VehicleBody3D

@export
var steering_multiplier:float = 1

@export
var used_for_driving: bool = true

@export
var canBreak: bool = true

@export
var friction_change: float
# Called when the node enters the scene tree for the first time.
func _ready():
	car_body = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	steering = lerpf(steering, (car_body.steering * steering_multiplier), 0.1)
	
	if Input.is_action_pressed("Break"):
		pass
	#steering = car_body.steering * steering_multiplier
	print(rad_to_deg(steering))
	if canBreak:
		brake = car_body.brake
	if used_for_driving:
		engine_force = car_body.engine_force;
	pass
