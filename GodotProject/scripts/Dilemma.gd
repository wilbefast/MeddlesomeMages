extends Control

signal on_resolved(option)

export(NodePath) var questionLabel
export(NodePath) var optionContainer

func set_data(dilemmaData : DilemmaData):
	get_node(questionLabel).text = dilemmaData.question

func chose_option(option):
	emit_signal("on_resolved", option)
