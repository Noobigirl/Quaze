class_name MouseMonitoring
extends Node2D

@export var detection_zone: Rect2 
var mouse_was_inside: bool = false

func _process(delta: float) -> void:
	# make use to only check if mouse is within the viewport of the game
	detecting_mouse()

func detecting_mouse():
	var mouse_pos = get_viewport().get_mouse_position() # position of mouse relative to the viewport
	var window_size = get_viewport_rect()
	var mouse_in_window = window_size.has_point(mouse_pos) # checking if mouse is inside the viewport
	var mouse_is_inside = detection_zone.has_point(mouse_pos) # checking if mouse is inside detection zone
	
	
	if not mouse_in_window:
		return
	print(mouse_pos)
	if mouse_is_inside and !mouse_was_inside: # emiting the signal only if the mouse is in the detection zone and the toolbar is hidden
		Toolbar.play_animation.emit("showing")
		mouse_was_inside = true
	elif !mouse_is_inside and mouse_was_inside: # emitting the signal only if the toolbar is visible
		Toolbar.play_animation.emit("hiding")
		mouse_was_inside = false
	
