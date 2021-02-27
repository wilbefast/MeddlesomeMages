extends Control

signal on_restart

export(NodePath) var renown_label
export(NodePath) var quest_label
export(NodePath) var wisdom_label

func _on_Button_pressed():
	emit_signal("on_restart")

var _attributes
func sort_attributes(a, b):
	if _attributes[a] < _attributes[b]:
		return true
	
func generate_text(attributes : Dictionary):
	_attributes = attributes 
	assert(_attributes != null)
	var attribute_names = _attributes.keys()
	attribute_names.sort_custom(self, "sort_attributes")
	_attributes = null
	
	get_node(renown_label).text = _generate_renown_text(attribute_names)
	get_node(quest_label).text = _generate_quest_text(attribute_names)
	get_node(wisdom_label).text = _generate_wisdom_text(attribute_names)
	
func _generate_renown_text(attribute_names : Array) -> String:
	# "The goblins know you as Gremweld the grey, speaking in hushed tones of your turquoise robes and staff made from a dragon's tooth." 
	var result = "The %s know you as %s %s, %s of your %s %s and %s %s made from %s."
	result = result % _get_random(["race", "name", "epithet", "legend", "colour", "clothes", "quality", "tool", "material" ])
	return result

func _generate_quest_text(attribute_names : Array) -> String:
	# "Your quest to leave your mark on the world is the stuff of legend."
	return attribute_names[0]

func _generate_wisdom_text(attribute_names : Array) -> String:
	# "But you know all too well that history is written by the victors: only through power can one live eternal."	
		return attribute_names[1]

var _thesaurus = {
	"race" : ["elves", "dwarves", "giants", "goblins", "gnomes", "trolls"],
	"name" : ["Meldrick", "Zalthar", "Kaliki", "Belux", "Alteir", "Xana", "Wiltred", "Vortoth", "Fandun", "Gelidan"],
	"epithet" : ["Hawkeye", "The Wise", "The Wandering", "The Beast", "Stormcloud", "Undefeated"],
	"legend" : ["speaking in hushed tones", "scaring their children with tales", "spreading word far and wide"],
	"colour" : ["red", "orange", "yellow", "white", "green", "blue", "indigo", "purple", "black", "grey", "black", "brown"],
	"clothes" : ["rags", "robes", "hood", "cloak", "mask", "hat"],
	"quality" : ["mighty", "deadly", "glowing", "burning", "hypnotic", "unbreakable"],
	"tool" : ["wand", "staff", "spear", "club", "rod"],
	"material" : ["a dragon's tooth", "an ancient oak", "a fallen star", "pure energy"]
}

func _get_random(args : Array) -> Array:
	randomize()
	var result = []
	for a in args:
		var possibilities = _thesaurus[a]
		result.push_back(possibilities[randi() % possibilities.size()])
	return result
