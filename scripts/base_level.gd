class_name level
extends MouseMonitoring

@export var bar: PackedScene = load("res://scenes/toolbar.tscn")
var tool_bar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tool_bar = bar.instantiate() 
	tool_bar.global_position = $ToolbarPosition.position # all levels must have this
	add_child(tool_bar)
func _process(delta: float) -> void:
	super._process(delta)
