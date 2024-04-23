extends Node3D

var pre_global_rot:Vector3 = Vector3(0,0,0)
var global_target_rot: Vector3 = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_target_rot = get_parent().global_rotation
	#global_target_rot.y += deg_to_rad(180)
	
	#global_rotation = pre_global_rot.move_toward( global_target_rot, delta*10)
	global_rotation.y = lerp_angle(pre_global_rot.y, global_target_rot.y, delta*6)
	#global_rotation.z = lerp_angle(pre_global_rot.z, -global_target_rot.z, delta*8)
	global_rotation.x = lerp_angle(pre_global_rot.x, -global_target_rot.x, delta*8)
	global_rotation.z = 0
	pre_global_rot = global_rotation
	#global_rotation.x = 0
	global_rotate(Vector3(0,1,0), deg_to_rad(180))
	
	pass
