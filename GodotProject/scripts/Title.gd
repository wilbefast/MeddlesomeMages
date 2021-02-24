extends Control

signal on_start

func _input(event : InputEvent): 
	if self.is_visible_in_tree() and event is InputEventMouseButton and event.pressed:
		emit_signal("on_start")
