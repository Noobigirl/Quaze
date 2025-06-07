extends Node2D

@export var gate: PackedScene # The main scene will instanciate some gates
@export var bar: PackedScene
# the type and textures must be set
var logic = "AND"  #logic of the current expression
var logic_array = ["AND", "OR", "NOT"] # array storing the logic of the gates
# storing the minimum correct logic required to solve the current expresssion


func create_gate() -> void:
	for logic in logic_array:
		var new_gate = gate.instantiate() # returns and instance of a the scene as a node
		new_gate.set_gate(logic, GlobalGates.logic_dict[logic]) # seting the logic and texuture of the gate
		
		Toolbar.contents.append(new_gate) # adding the gates to the toolbar

func _ready() -> void:
	$Label.text = "A " + logic + " B"
	$Placeholder.logic = logic # setting the logic of the placehoder
	create_gate() # creates the gates when the scene is loaded
	
	# --- setting up the toolbar in the scene
	var tool_bar = bar.instantiate() 
	tool_bar.global_position = $ToolbarPosition.position
	add_child(tool_bar)
