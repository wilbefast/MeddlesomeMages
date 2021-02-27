extends Control

signal on_restart

export(NodePath) var renown_label
export(NodePath) var quest_label
export(NodePath) var wisdom_label

func _on_Button_pressed():
	emit_signal("on_restart")

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
	get_node(wisdom_label).text = _generate_wisdom_text(attribute_names)
	
func _generate_renown_text(attribute_names : Array) -> String:
	# "The goblins know you as Gremweld the grey, speaking in hushed tones of your turquoise robes and staff made from a dragon's tooth." 
	var result = "The %s know you as %s %s, %s of your %s %s and %s %s made from %s."
	result = result % _get_random(["race", "name", "epithet", "legend", "colour", "clothes", "quality", "tool", "material" ])
	return result

func _generate_quest_text(attribute_names : Array) -> String:
	# "Your quest to leave your mark on the world is the stuff of legend."
	var result = "Your %s to %s is %s..."
	result = result % _get_random(["quest", "objective_" + attribute_names[1], "awesome"])
	return result

func _generate_wisdom_text(attribute_names : Array) -> String:
	# "But you know all too well that history is written by the victors: only through power can one live eternal!"	
	var result = "... but you %s that %s!"
	result = result % _get_random(["know", "wisdom_" + attribute_names[1] + "_" + attribute_names[0]])	
	return result

var _thesaurus = {
	"race" : ["elves", "dwarves", "southerners", "northmen", "halfings", "peasants", "fae", "gnomes", "giants"],
	"name" : ["Meldrick", "Zalthar", "Kalista", "Belux", "Alteir", "Xana", "Wiltred", 
			"Vortoth", "Fanreir", "Gelidan", "Chalivon", "Davile", "Eilthir", "Holdar",
			"Ilithan", "Jormuna", "Leomur", "Moragel", "Ovitt", "Paravir", "Queltir",
			"Rothquis", "Selimond", "Talbur", "Ultheir", "Yaltan"],
	"epithet" : ["Hawkeye", "The Wise", "The Wandering", "The Beast", "Stormcloud", "The Undefeated", "Blackguard", "Star-eyed"],
	"legend" : ["speaking in hushed tones", "scaring their children with tales", "spreading word far and wide"],
	"colour" : ["red", "orange", "yellow", "white", "green", "blue", "indigo", "purple", "black", "grey", "black", "brown"],
	"clothes" : ["rags", "robes", "hood", "cloak", "mask", "hat", "boots", "mantel"],
	"quality" : ["mighty", "deadly", "glowing", "burning", "hypnotic", "unbreakable"],
	"tool" : ["wand", "staff", "spear", "club", "rod", "scepter"],
	"material" : ["a dragon's tooth", "an ancient oak", "a fallen star", "pure energy"],
	"quest" : ["quest", "mission", "desire", "aspiration", "wish", "thirst", "need", "will", "yearning"],
	"objective_domination" : [ "rule the world", "acquire power", "reign over men" ],
	"objective_immortality" : [ "live forever", "be remembered", "achieve immortality" ],
	"objective_knowledge" : [ "achieve enlightenment", "acquire knowledge", "understand the universe" ],
	"objective_justice" : [ "protect the innocent", "punish the guilty", "uphold justice" ],
	"objective_sensation" : [ "wallow in hedonism", "experience every sensation", "live passionately"],
	"awesome" : ["nothing short of legendary", "the stuff of legend", "the stuff of myth", 
				"often misunderstood", "much debated by academics", "sung by the bards", 
				"the subject of many a ballad", "the inspiration for much epic poetry"],
	"know" : ["know all too well", "have come to understand", "have long known", "are well aware"],
	"wisdom_domination_immortality" : ["history is written by the victors: only through dominance can one live eternal"],
	"wisdom_domination_knowledge" : ["the doors of enlightenment must be forced open: one must have power"],
	"wisdom_domination_justice" : ["for justice to be upheld in the world a good person must rule it with an iron grip"],
	"wisdom_domination_sensation" : ["only an undisputed ruler is free to experience every sensation they crave"],
	"wisdom_immortality_domination" : ["he or she who lives eternal is free to pursue power, and welcomed by the masses"],
	"wisdom_immortality_knowledge" : ["a mortal can only learn so much: to learn every secret one must seek immortality"],
	"wisdom_immortality_justice" : ["the rule of law must be eternal, unbending, and so must its avatar"],
	"wisdom_immortality_sensation" : ["the world is vast: there is too much to experience for one life, so one much live many"],
	"wisdom_knowledge_domination" : ["knowledge is power: in the end the philosophers will be kings, and you first amongst them"],
	"wisdom_knowledge_immortality" : ["immortality is beyond the reach of all but the very wise: long study is necessary"],
	"wisdom_knowledge_justice" : ["to pursue justice you must first understand the consequences of every crime and punishment"],
	"wisdom_knowledge_sensation" : ["true ecstasy comes from the mind, not the body: only the wise truly appreciate their freedom"],
	"wisdom_justice_domination" : ["to rule one must be loved, and to be loved one must be seen to be righteous"],
	"wisdom_justice_immortality" : ["those who uphold justice live eternal, for men may die but the law lives on"],
	"wisdom_justice_knowledge" : ["only the impartial judge can ever hope to uncover the truth of the world"],
	"wisdom_justice_sensation" : ["all good men and women should be left free to indulge in the pleasures that this world has to offer"],
	"wisdom_sensation_domination" : ["the greatest of pleasures is to rule over others: to see them cover before you"],
	"wisdom_sensation_immortality" : ["when our cries of ecstasy reach the gods, only then do we achieve immortality"],
	"wisdom_sensation_knowledge" : ["there is truth in the intensity of sensation that cannot be found in reason"],
	"wisdom_sensation_justice" : ["one cannot uphold justice fairly until one has indulged in ever hybris oneself"]
}

func _get_random(args : Array) -> Array:
	randomize()
	var result = []
	for a in args:
		var possibilities = _thesaurus[a]
		result.push_back(possibilities[randi() % possibilities.size()])
	return result
