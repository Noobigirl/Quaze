extends Node

# -- signal used to make the toolbar dynamically disappear

signal gate_placed(placeholder)
signal has_won
# here I will associate the gate logics to the correct texture
var logic_dict: Dictionary = {
	"AND": "res://assets/gate_texture/and_gate.jpg",
	"OR": "res://assets/gate_texture/or_gate.jpg",
	"NOT": "res://assets/gate_texture/not_gate.jpg",
	"NAND": "res://assets/gate_texture/nand_gate.jpg",
	"NOR": "res://assets/gate_texture/nor_gate.jpg",
	"XOR": "res://assets/gate_texture/xor_gate.jpg",
	# add more gates later
	
}

var levels: Array = [
	["res://scenes/levels/level1.tscn", false],
	["res://scenes/levels/level2.tscn", true],
	["res://scenes/levels/level3.tscn", true],
]

var current_level:int = 0 # by default we will be on level 1
var logics : Array = logic_dict.keys()
var is_dragging = false # the mouse is not dragging anything by default
# we are keeping track of it to prevent hovering effect on other gates when we are dragging
# and also for the dynamic toolbar
