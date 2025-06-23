class_name MouseMonitoring
extends Node2D

@export var detection_zone: Rect2 
var mouse_was_inside: bool = false

func _process(delta: float) -> void:
	# make use to only check if the mouse is within the viewport of the game
	#print(get_global_mouse_position())
	detecting_mouse()

func detecting_mouse():
	var mouse_pos = get_global_mouse_position()
	var mouse_is_inside = detection_zone.has_point(mouse_pos)
	if mouse_is_inside and !mouse_was_inside: # emiting the signal only if the mouse is in the detection zone and the toolbar is hidden
		#print("mouse detected")
		Toolbar.play_animation.emit("showing")
		mouse_was_inside = true
	elif !mouse_is_inside and mouse_was_inside: # emitting the signal only if the toolbar is visible
		Toolbar.play_animation.emit("hiding")
		mouse_was_inside = false
	
