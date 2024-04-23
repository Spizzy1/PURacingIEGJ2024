extends Tree


# Called when the node enters the scene tree for the first time.
func _ready():
	var root = create_item()
	root.set_text(0, "root")
	
	var networking = create_item()
	networking.set_text(0, "Networking")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_cell_selected():
	var node = get_parent_control().get_child(1)
	
	for n in node.get_children():
		n.queue_free()
	var scene = load("res://%s.tscn" % get_selected().get_text(0))
	if scene:
		node.add_child(scene.instantiate())
	pass # Replace with function body.
