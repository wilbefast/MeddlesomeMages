extends Control

const Option = preload("res://scenes/Option.tscn")

signal on_resolved(option)

export(NodePath) var question_label
export(NodePath) var option_container
export(NodePath) var option_tooltip

func set_data(dilemma_data : DilemmaData):
	# Hide tooltip
	var option_tooltip_node = get_node(option_tooltip)
	option_tooltip_node.show_option(null)
	
	# Set questions
	get_node(question_label).text = dilemma_data.question

	# Set options
	var option_container_node = get_node(option_container)
	for option_data in dilemma_data.options:
		var option = Option.instance()
		option_container_node.add_child(option)
		option.option_data = option_data
		option.connect("on_chosen", self, "chose_option")
		option.connect("on_tooltipped", option_tooltip_node, "show_option")

func chose_option(option_data):
	var option_container_node = get_node(option_container)	
	for option in option_container_node.get_children():
		option.queue_free()
	emit_signal("on_resolved", option_data)
