extends Node3D

var current_map = 0

@onready
var maps = $"/root/Node3D/Maps".get_children()
# Called when the node enters the scene tree for the first time.
func _ready():
	for map in range(maps.size()):
		if map != current_map:
			invert_map(maps[map])
	pass # Replace with function body.

func invert_map(map : Node3D):
	print(map)
	print(map.visible)
	map.visible = !map.visible
	for child in map.get_children():
		var body : StaticBody3D = child.get_node_or_null("StaticBody3D")
		if body:
			body.collision_layer = int(!body.collision_layer)
			body.collision_mask = int(!body.collision_mask)
			
	pass
func switch_map():
	invert_map(maps[current_map])
	invert_map(maps[current_map+1])
	current_map += 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
