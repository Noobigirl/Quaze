class_name MouseMonitoring
extends Node2D

@export var detection_zone: Rect2 

func _process(delta: float) -> void:
	# make use to only check if the mouse is within the viewport of the game
	#print(get_global_mouse_position())
	detecting_mouse()

func detecting_mouse():
	var mouse_pos = get_global_mouse_position()
	if detection_zone.has_point(mouse_pos): # if that position is inside the rectangle
		print("mouse detected")
		Toolbar.play_animation.emit("hiding")
	else: 
		Toolbar.play_animation.emit("showing")
	
