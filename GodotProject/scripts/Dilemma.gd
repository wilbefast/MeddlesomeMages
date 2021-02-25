extends Control

signal on_resolved(option)

func set_data(dilemmaData : DilemmaData):
	$MarginContainer/VBoxContainer/CenterContainer/VBoxContainer/Label.text = dilemmaData.description

func chose_option(option):
	emit_signal("on_resolved", option)
