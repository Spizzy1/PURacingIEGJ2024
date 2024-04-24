extends Node

var origin = 0
var element_scene = preload("res://Isak/TimerContent.tscn")
var laps = 0
var current_element

var timer = 0
var start = false
@onready
var container = get_parent().get_node("PanelContainer/TableContainer")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#reset()
	pass # Replace with function body.


func new_timer():
	var element = preload("res://Isak/TimerContent.tscn").instantiate()
	element.get_node("Laps").text = str(laps)
	element.get_node("Time").text = ("%02d" % 00) + (":%02d" % 00) + (":%03d" % 00)
	return element
	pass

func reset():
	origin = Time.get_ticks_msec()
	laps += 1
	current_element = new_timer()
	container.add_child(current_element)
	if container.get_child_count() > 5:
		container.get_children()[4].queue_free()
	container.move_child(current_element, 1)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not start:
		timer+=delta
		get_parent().get_node("Startimer").text = str(floor(timer))
		if timer > 3:
			start = true
			get_parent().get_node("Startimer").visible = false
			reset()
		
	if current_element:
		var diff = Time.get_ticks_msec() - origin
		var minutes = int(diff / 60 / 1000)
		var seconds = int(diff / 1000) % 60
		var miliseconds = int(diff) % 1000
		current_element.get_node("Time").text = ("%02d" % minutes) + (":%02d" % seconds) + (":%03d" % miliseconds)
	pass


