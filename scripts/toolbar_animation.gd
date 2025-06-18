class_name BarAnimation
extends Node
@export_group("animation setup")
@export var transition_type: Tween.TransitionType
@export var property: String = "global_position"
@export var value: Vector2
@export var duration: float
var is_toolbar_visible: bool= true
var to_animate
var tween: Tween

func clean_tween() ->void: # to avoid tween "conflict"
	if tween:
		tween.kill() # deleting the previous tween
	tween = create_tween()
	
func animate_hidding() -> void:
	await to_animate.add_gate # wait for the gate to be instanced before hidding
	if not is_toolbar_visible:
		return # we don't want to animate for toolbar already hidden 
	clean_tween()
	tween.set_trans(transition_type)
	value.y += to_animate.global_position.y
	value.x = to_animate.global_position.x
	tween.tween_property(to_animate, property, value, duration)
	is_toolbar_visible = false
	
	#debug
	print("hiding")
	
	# get_tree().call_group("slot", "toggle_collision") # toggling the collision back on

func animate_emerging() -> void:
	if is_toolbar_visible:
		return # we don't want to animate if the toolbar is already visible
	clean_tween()
	tween.set_trans(transition_type)
	value.y -= 105 # try not to hard code this
	value.x = to_animate.global_position.x
	tween.tween_property(to_animate, property, value, duration)
	is_toolbar_visible = true
	
	#debug
	print("emerging")
	
