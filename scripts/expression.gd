class_name LogicExpression
extends Control

var inputs : Array = []
var logic_array: Array = []

func create_gate() -> void:
	for logic in logic_array:
		Toolbar.gates[logic] = GlobalGates.logic_dict[logic] # storing the logic and texture of the gate
	Toolbar.fetch_logic()
		
# setting the logic that each placeholder will check 
# and setting the text is unique for each expression


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
