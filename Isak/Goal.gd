extends Area3D

signal player_entered

@export
var totalCheckpoints = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Vehicle Body" && body.get_node("CheckpointTracker").curCheckP == totalCheckpoints:
		player_entered.emit()
		body.get_node("CheckpointTracker").curCheckP = 0
	pass # Replace with function body.



