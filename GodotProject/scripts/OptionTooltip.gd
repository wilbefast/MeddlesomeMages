extends Control

export(NodePath) var tooltip_label

var option_data : OptionData = null

func _ready():
	hide()

func show_option(new_option_data : OptionData, do_show : bool = true):
	if do_show and new_option_data != null:
		option_data = new_option_data
		get_node(tooltip_label).text = option_data.tooltip
		show()
	else:
		option_data = null
		hide()
