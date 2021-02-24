extends Control

signal on_chosen(content)
signal on_hovered(content)

var content = "Burn them all!"

func _ready():
	$Button.text = content

func _on_Button_pressed():
	emit_signal("on_chosen", content)

func _on_Button_mouse_entered():
	emit_signal("on_hovered", content)

func _on_Button_mouse_exited():
	emit_signal("on_hovered", null)
