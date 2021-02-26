extends Control

const OPTION = preload("res://scenes/Option.tscn")

signal on_resolved(option)

export(NodePath) var questionLabel
export(NodePath) var optionContainer
export(NodePath) var optionTooltip

func set_data(dilemmaData : DilemmaData):
	# Hide tooltip
	var optionTooltipNode = get_node(optionTooltip)
	optionTooltipNode.show_option(null)
	
	# Set questions
	get_node(questionLabel).text = dilemmaData.question

	# Set options
	var optionContainerNode = get_node(optionContainer)
	for optionData in dilemmaData.options:
		var option = OPTION.instance()
		optionContainerNode.add_child(option)
		option.optionData = optionData
		option.connect("on_chosen", self, "chose_option")
		option.connect("on_tooltipped", optionTooltipNode, "show_option")

func chose_option(optionData):
	var optionContainerNode = get_node(optionContainer)	
	for option in optionContainerNode.get_children():
		option.queue_free()
	emit_signal("on_resolved", optionData)
