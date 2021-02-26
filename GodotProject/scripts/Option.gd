extends Control

signal on_chosen(option)
signal on_tooltipped(option)

var option_data : OptionData setget option_set

func option_set(value):
	option_data = value
	$Button.text = option_data.title 

func _on_Button_pressed():
	emit_signal("on_chosen", option_data)

func _on_Button_mouse_entered():
	emit_signal("on_tooltipped", option_data, true)

func _on_Button_mouse_exited():
	emit_signal("on_tooltipped", option_data, false)
