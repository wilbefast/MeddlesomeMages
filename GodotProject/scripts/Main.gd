extends Node

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()
