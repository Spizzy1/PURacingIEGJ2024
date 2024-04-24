extends ColorRect

var shader_timer
var shader_value

# Called when the node enters the scene tree for the first time.
func _ready():
	shader_value = material.get_shader_parameter("radius")
	material.get_shader_parameter("radius")
	print(shader_value)
	shader_timer = get_node("ShaderTimer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !shader_timer.is_stopped:
		shader_value = clamp(shader_value, 0.0,shader_timer.time_left)

		material.set_shader_parameter("radius", shader_value)

	pass



func _on_goal_player_entered():
	shader_timer.start()
	

	pass # Replace with function body.


func _on_timer_timeout():
	shader_value=0
	pass # Replace with function body.
