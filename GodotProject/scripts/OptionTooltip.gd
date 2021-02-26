extends Control

var optionData : OptionData = null

func _ready():
	hide()

func show_option(new_optionData : OptionData, do_show : bool = true):
	if do_show and new_optionData != null:
		optionData = new_optionData
		$CenterContainer/Label.text = optionData.tooltip
		show()
	else:
		optionData = null
		hide()
