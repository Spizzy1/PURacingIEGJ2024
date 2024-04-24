extends Area3D

signal player_entered

@export
var totalCheckpoints = 0

@export
var totalLaps = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body is VehicleBody3D)
	if body is VehicleBody3D && body.get_node("CheckpointTracker").curCheckP == totalCheckpoints:
		if body.is_main:
			player_entered.emit()
			body.get_node("CheckpointTracker").curCheckP=0
			body.get_node("CheckpointTracker").curLap+=1
			
			if totalLaps == body.get_node("CheckpointTracker").curLap:
				var connector = null
				connector = get_node("/root/Main").get_node_or_null(str(get_node("/root/Main").id))
				if connector:
					connector.win.rpc_id(1, str(get_parent().name))
	pass # Replace with function body.



