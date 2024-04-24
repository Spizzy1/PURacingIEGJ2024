extends Node

var curCheckP = 0

var curLap = 0

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.






func chkPntPass(index):
	print(index)
	if curCheckP == (index-1):
		print("index: "+str(index))
		curCheckP+=1
		print("current checkpoint: "+str(curCheckP))
		var connector = null
		connector = get_node("/root/Main").get_node_or_null(str(get_node("/root/Main").id))
		get_parent().get_node_or_null(str(get_parent().id))
		if connector:
			connector.win.rpc_id(1, str(get_parent().name))
	pass



func _on_checkpoint_player_entered():
	print("test22")
	pass # Replace with function body.



func _get_signal(signalConnector):
	signalConnector.connect(signalConnector)
