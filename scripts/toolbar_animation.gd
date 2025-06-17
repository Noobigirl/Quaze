class_name BarAnimation
extends Node
@export_group("animation setup")
@export var transition_type: Tween.TransitionType
@export var property: String = "global_position"
@export var value: Vector2
@export var duration: float
var to_animate
var tween: Tween

func animate_hidding() -> void:
	tween = create_tween()
	tween.set_trans(transition_type)
	value.y += to_animate.global_position.y
	value.x = to_animate.global_position.x
	tween.tween_property(to_animate, property, value, duration)
	# get_tree().call_group("slot", "toggle_collision") # toggling the collision back on

func animate_emerging() -> void:
	tween = create_tween()
	tween.set_trans(transition_type)
	value.y -= to_animate.global_position.y # 
	value.x = to_animate.global_position.x
	tween.tween_property(to_animate, property, value, duration)
	
