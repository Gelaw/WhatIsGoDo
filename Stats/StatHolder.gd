extends Resource

class_name StatHolder

@export var jauges : Dictionary = {
	Life = [10, 10]
}

@export var stats : Dictionary = {
	"Strenght" 		= 0, # Affects weapon damage
	"Constitution" 	= 0, # Affects Life
	"Agility" 		= 0, # Affects Speed
	"Intelligence" 	= 0, # Affect spells?mana?
	"Wisdom" 		= 0  # Affect Xp gain
}

func init(parameter):
	if typeof(parameter) == TYPE_DICTIONARY:
		stats = parameter
		return
	pass

func StatBoost(StatName: String):
	stats[StatName] += 1
	match StatName:
		"Constitution":
			jauges.get("Life")[1] += 1
	pass
