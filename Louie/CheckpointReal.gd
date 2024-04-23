extends Area3D

signal player_entered

@export
var index = 0
@export
var totalInd = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#var player1 = get_node("Vehicle Body2")
	pass # Replace with function body.





func _on_body_entered(body):
	if body.name != "Vehicle Body":
		pass
	var chkPTrack = null
	if body.name == "Vehicle Body":
		chkPTrack = body.get_node("CheckpointTracker")

	if body.name == "Vehicle Body" && index > chkPTrack.curCheckP:
		print("test")
		chkPTrack.chkPntPass(index)
		#player_entered.emit(index)
	pass
