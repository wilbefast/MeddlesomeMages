extends Resource

class_name OptionData

var title : String
var tooltip : String
var attribute_modifiers : Dictionary

func _init(args):
	title = args["title"]
	tooltip = args["tooltip"]
	attribute_modifiers = args["attribute_modifiers"]
