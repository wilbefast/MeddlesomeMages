extends Control

signal on_start

func _on_StartButton_pressed():
	emit_signal("on_start")
