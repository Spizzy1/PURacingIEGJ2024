extends Node


var _victory = false
var victory_timer
var victory_scene = preload("res://Louie/VictoryScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	victory_timer = get_node("Timer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if _victory:
		Engine.time_scale = Engine.time_scale*0.01

		##if Engine.time_scale<0.01:
		_victory_scene_changer()
		##pass

	pass


func _victory_scene_changer():
	
	_victory=false
	victory_timer.start()
	
	pass

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.
