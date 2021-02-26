extends Node

var chosen_options : Array = []
var attributes = {
	"domination" : 0,
	"immortality" : 0,
	"knowledge" : 0,
	"justice" : 0,
	"sensation" : 0
}
var dilemmas : Array = []

func _ready():
	$Dilemma.hide()
	$GameOver.hide()

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()

func start_game():
	# update model
	for d in Database.dilemmas:
		dilemmas.push_back(d)
	dilemmas.shuffle()
	
	# update view
	$Title.hide()
	$Dilemma.show()
	$Dilemma.set_data(dilemmas.pop_front())

func restart():
	# update model
	chosen_options.clear()
	for key in attributes:
		attributes[key] = 0
	dilemmas.clear()
	
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
	
