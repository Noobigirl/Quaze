extends Node

signal slot_pressed(gate_logic) # signal is emitted when a slot of the tool bar is pressed
# the logic of the gate to instanced is passed along
signal play_animation(animation) # passing through the animation to be played

@export var max_size: int = 5

var gates: Dictionary = {} # 2D array holding the properties of the gate to instance [logic, texture]
var current_slot: int # keeping track of the slot that was clicked
var slot_logic: Array
 
func fetch_logic() -> void:
		slot_logic = gates.keys() # getting the logic of all the gates 
