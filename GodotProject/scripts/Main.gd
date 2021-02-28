extends Node

var _chosen_options : Array = []
var _attributes : Dictionary
var _max_attributes : Dictionary
var _dilemmas : Array

func _ready():
	$Dilemma.hide()
	$GameOver.hide()

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()

func start_game():
	# update model
	_attributes = Database.get_initial_attributes()
	_dilemmas = Database.get_initial_dilemmas(5)
	_max_attributes = Database.get_max_attributes(_dilemmas)
	print("drew ", _dilemmas.size(), " dilemmas for this playthrough")
	for m in _max_attributes.keys():
		print("maximum possible ", m, ": ", _max_attributes[m])
	
	# update view
	$Title.hide()
	$Dilemma.show()
	$Dilemma.set_data(_dilemmas.pop_front())

func restart():
	# update model
	_chosen_options.clear()
	
	# update view
	$GameOver.hide()
	$Title.show()

func next_dilemma(option_data : OptionData):
	# update model
	print("Chose option ", option_data.title)
	for key in option_data.attribute_modifiers:
		_attributes[key] += option_data.attribute_modifiers[key]
		print(key, " now has value ", _attributes[key])
	_chosen_options.push_back(option_data.title)
	var new_dilemma = _dilemmas.pop_front()
	
	# update view
	if new_dilemma == null:
		
		print("- GAME OVER -")
		print("chosen option were: ", _chosen_options)
		print("final values for attributes are:")
		for key in _attributes:
			print(key, " = ", _attributes[key])
		
		# Normalise attributes
		print("normalised attributes are:")
		for key in _attributes:
			_attributes[key] /= float(_max_attributes[key])
			print(key, " = ", _attributes[key])
		
		# Update view	
		$GameOver.generate_text(_attributes)
		$Dilemma.hide()	
		$GameOver.show()
	else:
		$Dilemma.set_data(new_dilemma)
	
