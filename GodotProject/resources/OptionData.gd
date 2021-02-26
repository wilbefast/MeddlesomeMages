extends Resource

class_name OptionData

export(String) var title
export(String) var tooltip

func _init(args):
	title = args["title"]
	tooltip = args["tooltip"]
