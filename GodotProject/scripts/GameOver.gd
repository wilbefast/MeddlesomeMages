extends Control

signal on_restart

export(NodePath) var renown_label
export(NodePath) var quest_label

func _on_RestartButton_pressed():
	emit_signal("on_restart")


func _on_ClipboardButton_pressed():
	OS.clipboard = get_node(renown_label).text + "\n" + get_node(quest_label).text

var _attributes
func sort_attributes(a, b):
	if _attributes[a] > _attributes[b]:
		return true
	
func generate_text(attributes : Dictionary):
	_attributes = attributes 
	assert(_attributes != null)
	var attribute_names = _attributes.keys()
	attribute_names.sort_custom(self, "sort_attributes")
	_attributes = null
	
	get_node(renown_label).text = _generate_renown_text(attribute_names)
	get_node(quest_label).text = _generate_quest_text(attribute_names)
	
func _generate_renown_text(attribute_names : Array) -> String:
	# "The goblins know you as Gremweld the grey, speaking in hushed tones of your turquoise robes and staff made from a dragon's tooth." 
	return Database.bake_synonyms("The %s know you as %s %s, %s of your %s %s and %s %s made from %s.", 
			["race", "name", "epithet_" + attribute_names[0], "legend", "colour_" + attribute_names[0], "clothes", "quality", "tool", "material" ])

func _generate_quest_text(attribute_names : Array) -> String:
	# "Your quest to leave your mark on the world is the stuff of legend."
	return Database.bake_synonyms("Your %s to %s is %s: you %s that %s!", 
			["quest", "objective_" + attribute_names[1], "awesome", "know", "wisdom_" + attribute_names[1] + "_" + attribute_names[0]])
