class_name LogicExpression
extends Control

var inputs : Array = []
var logic_array: Array = []
@export var gate: PackedScene
#@export var socket: PackedScene

func create_gate() -> void:
	for logic in logic_array:
		var new_gate = gate.instantiate() # returns and instance of a the scene as a node
		new_gate.set_gate(logic, GlobalGates.logic_dict[logic]) # seting the logic and texuture of the gate
		
		Toolbar.contents.append(new_gate) # adding the gates to the toolbar
		
# setting the logic that each placeholder will check 
# and setting the text is unique for each expression


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
