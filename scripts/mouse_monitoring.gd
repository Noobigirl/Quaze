class_name MouseMonitoring
extends Node2D

@export var detection_zone: Rect2 

func _process(delta: float) -> void:
	# make use to only check if the mouse is within the viewport of the game
	print(get_global_mouse_position())
