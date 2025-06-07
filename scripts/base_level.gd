class_name level
extends Node2D

@export var bar: PackedScene = load("res://scenes/toolbar.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tool_bar = bar.instantiate() 
	tool_bar.global_position = $ToolbarPosition.position # all levels must have this
	add_child(tool_bar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
