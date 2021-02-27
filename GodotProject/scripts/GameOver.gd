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
	var result = "The %s know you as %s %s, speaking in hushes tones of your %s %s and %s made from %s"
	result = result % [ _race(), _name(), _epithet(), _colour(), _clothes(), _tool(), _material() ] 
	#var word = words[randi() % words.size()]
	return result

func _generate_quest_text(attribute_names : Array) -> String:
	# "Your quest to leave your mark on the world is the stuff of legend."
	#var word = words[randi() % words.size()]
	return "derp"

func _generate_wisdom_text(attribute_names : Array) -> String:
	# "But you know all too well that history is written by the victors: only through power can one live eternal."	
	#var word = words[randi() % words.size()]
	return "derp"

func _race() -> String:
	return "elves"
	
func _name() -> String:
	return "Mike"

func _epithet() -> String:
	return "the strong"

func _colour() -> String:
	return "pink"
	
func _clothes() -> String:
	return "rags"
	
func _tool() -> String:
	return "compass"
	
func _material() -> String:
	return "glass"
