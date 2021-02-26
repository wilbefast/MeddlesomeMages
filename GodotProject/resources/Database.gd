extends Node

var dilemmas = [ 
	DilemmaData.new({
		"question" : "To derp or not to derp? That is the question.",
		"options" : [
			OptionData.new({
				"title" : "Derp",
				"tooltip" : "Derping sounds like the right option."
			}),
			OptionData.new({
				"title" : "Don't derp",
				"tooltip" : "Derping? What an awful notion!"
			})
		]
	}),
	DilemmaData.new({
		"question" : "'Flal', What does it mean? Where did it come from?",
		"options" : [
			OptionData.new({
				"title" : "Abandon hope",
				"tooltip" : "Today is not the day that we understand 'flal'..."
			})
		]
	})
]
