extends Resource

class_name OptionData

var title : String
var tooltip : String
var attributeModifiers : Dictionary

func _init(args):
	title = args["title"]
	tooltip = args["tooltip"]
	attributeModifiers = args["attributeModifiers"]
