extends VehicleBody3D

var wheels: Array = [];

@export
var engine_max: float = 150
@export
var steering_max_deg: float = 10
@export
var brake_force: float = 50

var is_main = true

var wasd = Vector3(0,0,0)
var isbreak

@export
var angular_correction_amount: float = 1

var timer:Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	timer.wait_time = 2
	for i in range(0,4):
		wheels.append(get_node("./Wheel_"+str(i+1)))
		#print(wheels[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if is_main && RaceGlobal.can_drive:
		wasd = Input.get_vector("Left", "Right","Backwards","Forwards")
		isbreak = Input.is_action_pressed("Break")
	engine_force = wasd.y*engine_max
	steering = deg_to_rad(wasd.x*steering_max_deg* -1)
	if isbreak:
		brake = brake_force
	else:
		brake = 0
	#print(str(rotation.x) + " and " + str(rotation.z))
	#rotation.x = (rotation.x * angular_correction_amount)
	#rotation.z = (rotation.z * angular_correction_amount)

	print(str(rotation.x) + " and " + str(rotation.z))
	var connector = get_node("/root/Main").get_node_or_null(str(get_node("/root/Main").id))
	
	#get_parent().get_node_or_null(str(get_parent().id))
	if connector and is_main:
		print("Cound connector")
		connector.sync_position.rpc_id(1, name, wasd, rotation, position, isbreak)
		pass
	#print(str(rotation.x) + " and " + str(rotation.z))

	if Input.is_action_pressed("Flip") and timer.is_stopped():
		timer.start()
		rotation.x = 0
		rotation.z = 0
		position += Vector3(0, 2, 0)
	pass
	
	#rotation_degrees.x = clamp(rotation_degrees.x, deg_to_rad(-50),deg_to_rad(50))
	#rotation_degrees.z = clamp(rotation_degrees.z, deg_to_rad(-50),deg_to_rad(50))

func _physics_process(delta):
	$"Camera Controller/Camera3D".fov =  linear_velocity.length()*2 + 50
