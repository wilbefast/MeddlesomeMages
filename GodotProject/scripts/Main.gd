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

func next_dilemma(option_data : OptionData):
	# update model
	print("Chose option ", option_data.title)
	for key in option_data.attribute_modifiers:
		attributes[key] += option_data.attribute_modifiers[key]
		print(key, " now has value ", attributes[key])
	chosen_options.push_back(option_data.title)
	var new_dilemma = dilemmas.pop_front()
	
	# update view
	if new_dilemma == null:
		print("- GAME OVER -")
		print("chosen option were: ", chosen_options)
		print("final values for attributes are:")
		for key in attributes:
			 print(key, " = ", attributes[key])
		$GameOver.generate_text(attributes)
		$Dilemma.hide()	
		$GameOver.show()
	else:
		$Dilemma.set_data(new_dilemma)
	
