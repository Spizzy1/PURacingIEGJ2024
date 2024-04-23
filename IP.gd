extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_text_submitted(new_text):
	if new_text != "":
		SettingsGlobal.ADRESS = new_text
	else:
		SettingsGlobal.ADRESS = SettingsGlobal.default_ADRESS
		
	pass # Replace with function body.
