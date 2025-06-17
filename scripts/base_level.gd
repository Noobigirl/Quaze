class_name level
extends Node2D

@export var bar: PackedScene = load("res://scenes/toolbar.tscn")
@export var detection_area: Vector2
var tool_bar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tool_bar = bar.instantiate() 
	tool_bar.global_position = $ToolbarPosition.position # all levels must have this
	add_child(tool_bar)
	set_bar_area()

func set_bar_area() -> void:
	# investigate why the area is not created
	
	#--- creating the detection area of the toolbar
	var toolbar_area = Area2D.new() 
	toolbar_area.name = "Bar Area"
	
	#--- creating the shape of that area
	var toolbar_area_shape = CollisionShape2D.new()
	var collision_shape = RectangleShape2D.new() # setting the shape to a rectangle
	collision_shape.size = detection_area # setting the size of the rectangle to the size of the bar
	toolbar_area_shape.shape = collision_shape
	toolbar_area_shape.position = Vector2.ZERO
	toolbar_area.add_child(toolbar_area_shape)
	
	# --- setting the position of the area and collision shape to the position of the toolbar
	toolbar_area.position = $ToolbarPosition.position
	toolbar_area.collision_layer = 3
	add_child(toolbar_area)
	print("area size =", collision_shape.size)
	print("area position,",toolbar_area.position )
	print("area added", toolbar_area)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
