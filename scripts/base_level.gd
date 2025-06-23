class_name level
extends MouseMonitoring


signal show_toolbar # signal used to trigger the showing animation

@export var bar: PackedScene = load("res://scenes/toolbar.tscn")
@export var detection_area: Vector2
@export var trigger_signals: Array[String] # setting the default signals 
var toolbar_area: Area2D
var toolbar_area_shape: CollisionShape2D
var tool_bar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tool_bar = bar.instantiate() 
	tool_bar.showing_signal = show_toolbar
	tool_bar.global_position = $ToolbarPosition.position # all levels must have this
	add_child(tool_bar)
