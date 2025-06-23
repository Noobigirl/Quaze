class_name MouseMonitoring
extends Node2D

@export var detection_zone: Rect2 

func _process(delta: float) -> void:
	# make use to only check if the mouse is within the viewport of the game
	#print(get_global_mouse_position())
	detecting_mouse()

func detecting_mouse():
	var mouse_pos = get_global_mouse_position()
	if detection_zone.has_point(mouse_pos) and !Toolbar.is_visible: # emiting the signal only if the mouse is in the detection zone and the toolbar is hidden
		#print("mouse detected")
		Toolbar.play_animation.emit("showing")
	elif Toolbar.is_visible: # emitting the signal only if the toolbar is visible
		Toolbar.play_animation.emit("hiding")
	
