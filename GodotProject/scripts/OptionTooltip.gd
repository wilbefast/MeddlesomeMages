extends Control

func _ready():
	hide()

func show_option(content):
	if content == null:
		hide()
	else:
		$CenterContainer/Label.text = "One day this tooltip will contain useful information about '" + content + "'. This is not that day."
		show()
	
