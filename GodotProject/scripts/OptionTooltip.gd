extends Control

const AttributeModifierLabel = preload("res://scenes/AttributeModifierLabel.tscn")

export(NodePath) var tooltip_label
export(NodePath) var attribute_modifier_container

var option_data : OptionData = null

func _ready():
	hide()

func show_option(new_option_data : OptionData, do_show : bool = true):
	if do_show and new_option_data != null:
		# Tooltip description
		option_data = new_option_data
		# This is broken for reasons I can't fathom				
		#get_node(tooltip_label).text = option_data.tooltip
		$VBoxContainer/TooltipLabel.text = option_data.tooltip
		
		# Tooltip breakdown
		# This is broken for reasons I can't fathom		
		#var attribute_modifier_container_node = get_node(attribute_modifier_container)
		var attribute_modifier_container_node = $VBoxContainer/AttributeModifierContainer
		for attribute in option_data.attribute_modifiers:
			var modifier_label = AttributeModifierLabel.instance()
			attribute_modifier_container_node.add_child(modifier_label)
			
			var modifier_value = option_data.attribute_modifiers[attribute]
			assert(modifier_value != 0)
			if modifier_value > 0:
				modifier_label.text = "+" + str(modifier_value) + " " + attribute
			elif modifier_value < 0:
				modifier_label.text = "-" + str(modifier_value) + " " + attribute		
		# all done, show it off
		show()
	else:
		# This is broken for reasons I can't fathom		
		#var attribute_modifier_container_node = get_node(attribute_modifier_container)
		var attribute_modifier_container_node = $VBoxContainer/AttributeModifierContainer
		assert(attribute_modifier_container_node != null)
		option_data = null
		for attribute_modifier_label in attribute_modifier_container_node.get_children():
			attribute_modifier_label.queue_free() 		
		hide()
