extends Node
signal toolbar_updated

signal slot_pressed # signal is emitted when a slot of the tool bar is pressed

@export var max_size: int = 5
@onready var slot_size: int # the expression will define the number of gates added
var contents: Array = [] # holding gate scene instances
# --- prototyping side functionality 
var current_slot

func add_gate() ->void:
	toolbar_updated.emit()
	
func remove_gate() -> void:
	toolbar_updated.emit()
