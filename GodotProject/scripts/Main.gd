extends Node

func _input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()
