extends Node

func _ready():
	$Dilemma.hide()
	$GameOver.hide()

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()

func start_game():
	yield(get_tree(), "idle_frame")
	$Title.hide()
	$Dilemma.show()

func end_game():
	yield(get_tree(), "idle_frame")
	$Dilemma.hide()	
	$GameOver.show()
	
func restart():
	yield(get_tree(), "idle_frame")
	$Title.show()
	$GameOver.hide()

func next_dilemma(option):
	# End the game if there are no dilemmas left to solve
	end_game()
