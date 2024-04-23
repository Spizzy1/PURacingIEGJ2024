extends Node3D

var pre_global_rot:Vector3 = Vector3(0,0,0)
var global_target_rot: Vector3 = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_target_rot = get_parent_node_3d().rotation
	global_target_rot.y += 180
	#sglobal_rotation = global_rotation.move_toward( global_target_rot, delta)
	pass
