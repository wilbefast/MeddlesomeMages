extends Control

var optionData : OptionData = null

func _ready():
	hide()

func show_option(new_optionData, do_show):
	if do_show and new_optionData != null:
		optionData = new_optionData
		$CenterContainer/Label.text = optionData.tooltip
		show()
	else:
		optionData = null
		hide()
