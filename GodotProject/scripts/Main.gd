extends Node

var chosen_options : Array = []
var attributes : Dictionary
var dilemmas : Array

func _ready():
	$Dilemma.hide()
	$GameOver.hide()

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()

func start_game():
	# update model
	attributes = Database.get_initial_attributes()
	dilemmas = Database.get_initial_dilemmas()
	
	# update view
	$Title.hide()
	$Dilemma.show()
	$Dilemma.set_data(dilemmas.pop_front())

func restart():
	# update model
	chosen_options.clear()
	
	# update view
	$GameOver.hide()
	$Title.show()

func next_dilemma(optionData : OptionData):
	# update model
	print("Chose option ", optionData.title)
	for key in optionData.attributeModifiers:
		attributes[key] += optionData.attributeModifiers[key]
		print(key, " now has value ", attributes[key])
	chosen_options.push_back(optionData.title)
	var new_dilemma = dilemmas.pop_front()
	
	# update view
	if new_dilemma == null:
		print("Gameover - chosen option were ", chosen_options)
		$Dilemma.hide()	
		$GameOver.show()
	else:
		$Dilemma.set_data(new_dilemma)
	
