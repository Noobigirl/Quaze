extends Node2D

@export var gate: PackedScene # The main scene will instanciate some gates
# the type and textures must be set
var logic = "AND"  #logiuc of the current expression


var logic_array = ["AND", "OR", "NOT"] # array storing the logic of the gates
# storing the minimum correct logic required to solve the current expresssion


# since the bar is not there yet, just placing the gate at a default position
var default_posiion = Vector2(10, 50) 

func create_gate() -> void:
	# make it instanciate the gates in the inventory later
	for logic in logic_array:
		var new_gate = gate.instantiate() # returns and instance of a the scene as a node
		new_gate.set_gate(logic, GlobalGates.logic_dict[logic]) # seting the logic and texuture of the gate
		new_gate.position = default_posiion
		default_posiion+= Vector2(20, 0)
		add_child(new_gate) # must be added as child of the main scene
		# otherwise it won't be seen
		

func _ready() -> void:
	$Label.text = "A " + logic + " B"
	$Placeholder.logic = logic
	create_gate() # creates the gates when the scene is loaded
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print($Gate.logic == logic)
	pass
