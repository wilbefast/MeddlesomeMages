extends Node

var dilemma_index : int

func _ready():
	$Dilemma.hide()
	$GameOver.hide()

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()

func start_game():
	$Title.hide()
	$Dilemma.show()
	dilemma_index = 0
	$Dilemma.set_data(Database.dilemmas[0])

func restart():
	$Title.show()
	$GameOver.hide()

func next_dilemma(option):
	# TODO: save option
	dilemma_index += 1
	if dilemma_index >= Database.dilemmas.size():
		$Dilemma.hide()	
		$GameOver.show()
	else:
		$Dilemma.set_data(Database.dilemmas[dilemma_index])
	
