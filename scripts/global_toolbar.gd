extends Node
signal toolbar_updated

@export var max_size: int = 5
@onready var slot_size: int # the expression will define the number of gates added
var contents: Array = [] # holding gate scene instances

func add_gate() ->void:
	toolbar_updated.emit()
	
func remove_gate() -> void:
	toolbar_updated.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	#$GridContainer.columns = slot_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
