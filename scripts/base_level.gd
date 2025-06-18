class_name level
extends Node2D

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
	set_bar_area()#
	# -- connecting the default signals
	toolbar_area.connect(trigger_signals[0], enable_collision) 
	toolbar_area.connect(trigger_signals[1], mouse_enters)
	
	# -- handling dynamic change of the signals
	GlobalGates.dragging.connect(change_signal_to_area)
	GlobalGates.stopped_dragging.connect(change_signal_to_mouse)

func set_bar_area() -> void:
	
	# --- creating the detection area of the toolbar
	toolbar_area = Area2D.new() 
	toolbar_area.name = "BarArea"
	
	# --- creating the shape of that area
	toolbar_area_shape = CollisionShape2D.new()
	toolbar_area_shape.name = "DetectBar"
	#toolbar_area_shape.disabled = true
	
	# --- setting the shape to a rectangle
	var collision_shape = RectangleShape2D.new() 
	collision_shape.size = detection_area # setting the size of the rectangle to the size of the bar
	toolbar_area_shape.shape = collision_shape
	toolbar_area_shape.position = Vector2.ZERO
	toolbar_area.add_child(toolbar_area_shape)
	
	# --- setting the position of the area and collision shape to the position of the toolbar
	toolbar_area.position = $ToolbarPosition.position
	toolbar_area.collision_layer = 4
	add_child(toolbar_area)
	
	# --- for debugging purposes
	print("area size : ", collision_shape.size)
	print("area position: ",toolbar_area.position )
	print("area added: ", toolbar_area)

func enable_collision(area = null) -> void: # setting a default value to avoid conflict with the signals
	#toolbar_area_shape.disabled = false
	
	# debug
	print("exited")

# testing something
func mouse_enters(area = null) -> void:
	print("entered")
	show_toolbar.emit()

func change_signal_to_area() -> void:
	# disconnecting the old signals 
		toolbar_area.disconnect(trigger_signals[0], enable_collision)
		toolbar_area.disconnect(trigger_signals[1], mouse_enters)
		
		trigger_signals = ["area_exited", "area_entered"]
		
	# connecting the new signals
		toolbar_area.connect(trigger_signals[0], enable_collision) 
		toolbar_area.connect(trigger_signals[1], mouse_enters) 
	
		# --- debugging
		print("signal changed to area")

func change_signal_to_mouse() -> void:
	# disconnecting the old signals 
		toolbar_area.disconnect(trigger_signals[0], enable_collision)
		toolbar_area.disconnect(trigger_signals[1], mouse_enters)
		trigger_signals = ["mouse_exited", "mouse_entered"]
		
	# connecting the new signals
		toolbar_area.connect(trigger_signals[0], enable_collision) 
		toolbar_area.connect(trigger_signals[1], mouse_enters)
		
			# --- debugging
		print("signal changed to mouse")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
