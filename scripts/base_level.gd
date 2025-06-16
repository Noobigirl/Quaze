class_name level
extends Node2D

@export var bar: PackedScene = load("res://scenes/toolbar.tscn")
var tool_bar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tool_bar = bar.instantiate() 
	tool_bar.global_position = $ToolbarPosition.position # all levels must have this
	add_child(tool_bar)
	set_bar_area()

func set_bar_area() -> void:
	#--- creating the detection area of the toolbar
	var toolbar_area = Area2D.new() 
	toolbar_area.name = "Bar Area"
	
	#--- creating the shape of that area
	var toolbar_area_shape = CollisionShape2D.new()
	toolbar_area_shape.shape = RectangleShape2D.new() # setting the shape to a rectangle
	toolbar_area_shape.shape.size = tool_bar.size # setting the size of the rectangle to the size of the bar
	toolbar_area.add_child(toolbar_area_shape)
	
	# --- setting the position of the area and collision shape to the position of the toolbar
	toolbar_area_shape.global_position = tool_bar.global_position
	toolbar_area.global_position = tool_bar.global_position
	add_child(toolbar_area)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
