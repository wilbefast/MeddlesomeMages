extends Control

signal on_chosen(option)
signal on_tooltipped(option)

var optionData : OptionData setget option_set

func option_set(value):
	optionData = value
	$Button.text = optionData.title 

func _on_Button_pressed():
	emit_signal("on_chosen", optionData)

func _on_Button_mouse_entered():
	emit_signal("on_tooltipped", optionData, true)

func _on_Button_mouse_exited():
	emit_signal("on_tooltipped", optionData, false)
