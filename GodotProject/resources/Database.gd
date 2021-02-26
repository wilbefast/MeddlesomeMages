extends Node

var attributes = [
	"domination",
	"immortality",
	"knowledge",
	"justice",
	"sensation"
]

var dilemmas = [ 
	DilemmaData.new({
		"question" : "To derp or not to derp? That is the question.",
		"options" : [
			OptionData.new({
				"title" : "Derp",
				"tooltip" : "Derping sounds like the right option.",
				"attribute_modifiers" : {
					"domination" : 1,
					"immortality" : 2
				}
			}),
			OptionData.new({
				"title" : "Don't derp",
				"tooltip" : "Derping? What an awful notion!",
				"attribute_modifiers" : {
					"knowledge" : 1,
					"justice" : 2
				}
			})
		]
	}),
	DilemmaData.new({
		"question" : "'Flal', What does it mean? Where did it come from?",
		"options" : [
			OptionData.new({
				"title" : "Abandon hope",
				"tooltip" : "Today is not the day that we understand 'flal'...",
				"attribute_modifiers" : {
					"justice" : 1,
					"sensation" : 2
				}
			})
		]
	})
]

func get_initial_attributes():
	var result = {}
	for a in attributes:
		result[a] = 0
	return result

func get_initial_dilemmas():
	var result = []
	for d in dilemmas:
		result.push_back(d)
	result.shuffle()
	return result
