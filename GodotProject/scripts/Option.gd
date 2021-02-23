extends Control

signal on_chosen(content)

var content = "Burn them all!"

func _ready():
	$Button.text = content

func _on_Button_pressed():
	emit_signal("on_chosen", content)
