extends Node

signal slot_pressed(gate_logic) # signal is emitted when a slot of the tool bar is pressed
# the logic of the gate to instanced is passed along
signal play_animation(animation) # passing through the animation to be played
signal level_changed # signal emitted when we need to reset a toolbar for the next level

@export var max_size: int = 5

var gates: Dictionary = {} # 2D array holding the properties of the gate to instance [logic, texture]
var current_slot: int # keeping track of the slot that was clicked
var slot_logic: Array =[]
var is_visible: bool = true
 
func fetch_logic() -> void:
		slot_logic += gates.keys() # getting the logic of all the gates 

# we must reset everything for each level:

func _on_level_changed():
	gates.clear()
	current_slot = 0 
	slot_logic.clear()
	is_visible = true

func _ready() -> void:
	level_changed.connect(_on_level_changed)
