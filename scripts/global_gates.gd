extends Node
# here I will associate the gate logics to the correct texture
var logic_dict: Dictionary = {
	"AND": "res://icon.svg",
	"OR": "res://icon.svg",
	"NOT": "res://icon.svg",
	# add more gates later
	
}

var logics : Array = logic_dict.keys()
