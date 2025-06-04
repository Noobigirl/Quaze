extends Node
# here I will associate the gate logics to the correct texture
var logic_dict: Dictionary = {
	"AND": "res://icon.svg",
	"OR": "res://icon.svg",
	"NOT": "res://icon.svg",
	"NAND": "res://icon.svg",
		
	# add more gates later
	
}

var logics : Array = logic_dict.keys()
var is_dragging = false # the mouse is not dragging anything by default
# we are keeping track of it to prevent hovering effect on other gates when we are dragging
