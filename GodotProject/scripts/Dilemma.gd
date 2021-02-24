extends Control

signal on_resolved(option)

func chose_option(option):
	emit_signal("on_resolved", option)
