extends Resource

class_name DilemmaData

var question
var options
var image

func _init(args):
	question = args["question"]
	options = args["options"]
	image = "res://images/" + args["image"]
	print(image)
	
