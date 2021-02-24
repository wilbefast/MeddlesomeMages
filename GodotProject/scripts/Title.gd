extends Control

signal on_start

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		accept_event()
		emit_signal("on_start")
