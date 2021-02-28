extends Node

func _init():
	randomize()
	
	# Count the number of dilemmas
	print("there are ", _dilemmas.size(), " dilemmas - if all were used")
	
	# Count the maximum possible score per attribute
	var max_attributes = get_max_attributes()
	for m in max_attributes.keys():
		print("maximum possible ", m, ": ", max_attributes[m])

var _attributes = [
	"domination",
	"immortality",
	"knowledge",
	"justice",
	"freedom"
]

var _dilemmas = [ 
	DilemmaData.new({
		"image" : "tarot_13.jpg",
		"question" : "A plague is sweeping through the countryside!",
		"options" : [
			OptionData.new({
				"title" : "Help",
				"tooltip" : "Tend to the sick and better understand the body.",
				"attribute_modifiers" : {
					"justice" : 2,
					"knowledge" : 2
				}
			}),
			OptionData.new({
				"title" : "Leave",
				"tooltip" : "It's time to visit other, safer, parts of the world.",
				"attribute_modifiers" : {
					"immortality" : 3,
					"freedom" : 1
				}
			}),
			OptionData.new({
				"title" : "Gloat",
				"tooltip" : "That'll teach them to ask you for love potions!",
				"attribute_modifiers" : {
					"domination" : 3,
					"freedom" : 1
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_09.jpg",
		"question" : "What spell have you most often cast on others?",
		"options" : [
			OptionData.new({
				"title" : "Fireball",
				"tooltip" : "Sometimes you get impatient. Often, to be honest...",
				"attribute_modifiers" : {
					"freedom" : 4
				}
			}),
			OptionData.new({
				"title" : "Command",
				"tooltip" : "It's amazing what people will tell you when forced.",
				"attribute_modifiers" : {
					"domination" : 2,
					"knowledge" : 2
				}
			}),
			OptionData.new({
				"title" : "Heal",
				"tooltip" : "Repairing the body is something of a personal obsession.",
				"attribute_modifiers" : {
					"justice" : 3,
					"immortality" : 1
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_15.jpg",
		"question" : "When you stare into the abyss, what stares back?",
		"options" : [
			OptionData.new({
				"title" : "Excess",
				"tooltip" : "A mass of undulating curves and hungry maws.",
				"attribute_modifiers" : {
					"freedom" : 3,
					"knowledge" : 1
				}
			}),
			OptionData.new({
				"title" : "Ambition",
				"tooltip" : "Crowned in sinew, it grins from its throne of skulls.",
				"attribute_modifiers" : {
					"domination" : 2,
					"immortality" : 2
				}
			}),
			OptionData.new({
				"title" : "Vengeance",
				"tooltip" : "Blind, it strikes out wildly with hooked blades.",
				"attribute_modifiers" : {
					"justice" : 2
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_16.jpg",
		"question" : "When not out travelling the world, where do you abide?",
		"options" : [
			OptionData.new({
				"title" : "Shack",
				"tooltip" : "You have little interest in bourgeois hypocrisies",
				"attribute_modifiers" : {
					"freedom" : 3,
					"knowledge" : 1
				}
			}),
			OptionData.new({
				"title" : "Library",
				"tooltip" : "A hermit cannot compile records or offer council.",
				"attribute_modifiers" : {
					"knowledge" : 3,
					"justice" : 1
				}
			}),
			OptionData.new({
				"title" : "Fortress",
				"tooltip" : "Its defenders' blades are sharp and they never sleep.",
				"attribute_modifiers" : {
					"domination" : 3,
					"immortality" : 1
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_18.jpg",
		"question" : "Mournful spirits haunt the site of a recent battlefield...",
		"options" : [
			OptionData.new({
				"title" : "Entreat",
				"tooltip" : "What dark knowledge might these specters impart?",
				"attribute_modifiers" : {
					"immortality" : 3,
					"knowledge" : 1
				}
			}),
			OptionData.new({
				"title" : "Recruit",
				"tooltip" : "Promise vengeance to your new army of the dead.",
				"attribute_modifiers" : {
					"domination" : 4,
				}
			}),
			OptionData.new({
				"title" : "Release",
				"tooltip" : "Help the wraiths to find their way beyond the veil.",
				"attribute_modifiers" : {
					"justice" : 2,
					"freedom" : 2
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_20.jpg",
		"question" : "A ritual to gain foreknowledge of your death would be...",
		"options" : [
			OptionData.new({
				"title" : "Impossible",
				"tooltip" : "After all, you have no intention of dying. Ever.",
				"attribute_modifiers" : {
					"immortality" : 4
				}
			}),
			OptionData.new({
				"title" : "Intriguing",
				"tooltip" : "Even the most painful truths must be sought out.",
				"attribute_modifiers" : {
					"knowledge" : 3,
					"domination" : 1
				}
			}),
			OptionData.new({
				"title" : "Folly",
				"tooltip" : "To know one's destiny in advance is against nature.",
				"attribute_modifiers" : {
					"justice" : 3,
					"freedom" : 1
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_12.jpg",
		"question" : "Ahead on the road, bandits have held up a merchant caravan...",
		"options" : [
			OptionData.new({
				"title" : "Intercede",
				"tooltip" : "Use your powers to protect the weak.",
				"attribute_modifiers" : {
					"justice" : 4
				}
			}),
			OptionData.new({
				"title" : "Avoid",
				"tooltip" : "Your life is far too valuable to be risked...",
				"attribute_modifiers" : {
					"immortality" : 2,
					"domination" : 2
				}
			}),
			OptionData.new({
				"title" : "Watch",
				"tooltip" : "An opportunity to study their tactics first-hand!",
				"attribute_modifiers" : {
					"knowledge" : 3,
					"freedom" : 1
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_05.jpg",
		"question" : "You are summoned to court, how do you respond?",
		"options" : [
			OptionData.new({
				"title" : "Ignore",
				"tooltip" : "Life is too short to be wasted on politics.",
				"attribute_modifiers" : {
					"immortality" : 3,
					"knowledge" : 1
				}
			}),
			OptionData.new({
				"title" : "Punish",
				"tooltip" : '"Summoned"? Rain hell upon these presumptuous fools!',
				"attribute_modifiers" : {
					"freedom" : 3,
					"domination" : 1
				}
			}),
			OptionData.new({
				"title" : "Obey",
				"tooltip" : "You duty, and a chance to pull some strings...",
				"attribute_modifiers" : {
					"justice" : 3,
					"domination" : 1
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_01.jpg",
		"question" : "What sort of familiar keeps you company?",
		"options" : [
			OptionData.new({
				"title" : "Crow",
				"tooltip" : "A clever bird, and from above it sees everything.",
				"attribute_modifiers" : {
					"knowledge" : 1,
					"justice" : 1
				}
			}),
			OptionData.new({
				"title" : "Tortoise",
				"tooltip" : "Impervious to attack and to the ravages of time.",
				"attribute_modifiers" : {
					"domination" : 1,
					"immortality" : 1
				}
			}),
			OptionData.new({
				"title" : "Cat",
				"tooltip" : "It welcomes your caress, but is its own creature.",
				"attribute_modifiers" : {
					"freedom" : 2
				}
			})
		]
	}),
	DilemmaData.new({
		"image" : "tarot_10.jpg",
		"question" : "The old king is dead! Which pretender do you support?",
		"options" : [
			OptionData.new({
				"title" : "Heir",
				"tooltip" : "Rumours of a secret progeny must be investigated.",
				"attribute_modifiers" : {
					"justice" : 2,
					"knowledge" : 2
				}
			}),
			OptionData.new({
				"title" : "Pawn",
				"tooltip" : "Your designs require someone pliable to sit the throne.",
				"attribute_modifiers" : {
					"domination" : 3,
					"immortality" : 1
				}
			}),
			OptionData.new({
				"title" : "Idiot",
				"tooltip" : "With an imbecile in power you'll be left alone.",
				"attribute_modifiers" : {
					"freedom" : 4
				}
			})
		]
	})
]

var _thesaurus = {
	"race" : ["elves", "dwarves", "southerners", "northmen", "halfings", "peasants", "gnomes", "giants"],
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
	"objective_freedom" : [ "serve no master", "go and do as you please", "live without bonds"],
	"awesome" : ["nothing short of legendary", "the stuff of legend", "the stuff of myth", 
				"often misunderstood", "much debated by academics", "sung by the bards", 
				"the subject of many a ballad", "the inspiration for much epic poetry"],
	"know" : ["know all too well", "have come to understand", "have long known", "are well aware"],
	"wisdom_domination_immortality" : ["only a conqueror can challenge the gods and pry immortality from their grip"],
	"wisdom_domination_knowledge" : ["the doors of enlightenment must be forced open - one must have power"],
	"wisdom_domination_justice" : ["for justice to be upheld in the world a good person must rule it with an iron grip"],
	"wisdom_domination_freedom" : ["only an undisputed ruler is free to go wherever and do whatever please them"],
	"wisdom_immortality_domination" : ["they who live eternal are free to pursue power, becoming living gods in time"],
	"wisdom_immortality_knowledge" : ["a mortal can only learn so much - to learn every secret one must seek immortality"],
	"wisdom_immortality_justice" : ["the rule of law must be eternal, unbending, and so must its avatar"],
	"wisdom_immortality_freedom" : ["death is the true tyrant - to be truly free one must first escape from its clutches"],
	"wisdom_knowledge_domination" : ["knowledge is power - in the end the philosophers will be kings, and you first amongst them"],
	"wisdom_knowledge_immortality" : ["immortality is beyond the reach of all but the very wise, so long study is necessary"],
	"wisdom_knowledge_justice" : ["to pursue justice you must first understand the consequences of every crime and punishment"],
	"wisdom_knowledge_freedom" : ["only the wise truly appreciate their freedom - a fool wouldn't know what to do with it"],
	"wisdom_justice_domination" : ["to rule one must be loved, and to be loved one must be seen to be righteous"],
	"wisdom_justice_immortality" : ["those who uphold justice live eternal, for men may die but the law lives on"],
	"wisdom_justice_knowledge" : ["only the impartial judge can ever hope to uncover the truth of the world"],
	"wisdom_justice_freedom" : ["all good men and women should be left free to drink from the cup this world has to offer"],
	"wisdom_freedom_domination" : ["only when your own bonds have been broken can you bring others under the yoke"],
	"wisdom_freedom_immortality" : ["the gods do not grant eternal life to the servile and unimaginative"],
	"wisdom_freedom_knowledge" : ["the darkest truths can only be understood through first-hand experience"],
	"wisdom_freedom_justice" : ["one cannot uphold justice fairly until one has indulged in ever hybris oneself"]
}

func get_initial_attributes():
	var result = {}
	for a in _attributes:
		result[a] = 0
	return result

func get_max_attributes(dilemmas : Array = _dilemmas):
	var result = get_initial_attributes()
	for d in dilemmas:
		for o in d.options:
			for m in result.keys():
				if o.attribute_modifiers.has(m):
					result[m] += o.attribute_modifiers[m]
	return result

func get_initial_dilemmas(count : int = _dilemmas.size()):
	var result = []
	for d in _dilemmas:
		result.push_back(d)
	result.shuffle()
	result.resize(count)
	return result

func bake_synonyms(template : String, words : Array) -> String:
	var chosen_synonyms = []
	for w in words:
		var all_synonyms = _thesaurus[w]
		chosen_synonyms.push_back(all_synonyms[randi() % all_synonyms.size()])
	return template % chosen_synonyms

