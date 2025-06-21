class_name LogicExpression
extends Control

var inputs : Array = []
var logic_array: Array = []

func create_gate() -> void:
	for logic in logic_array:
		Toolbar.gates[logic] = GlobalGates.logic_dict[logic] # storing the logic and texture of the gate
	Toolbar.fetch_logic() # storing the keys of the logic_dict 
