class_name Button_animation
extends Button
@export var duration: float = 0.2
@export var transition: Tween.TransitionType
var tween: Tween

func _ease_in():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(transition)
	tween.tween_property(self,"scale", Vector2(1.1, 1.1), duration)

func _ease_out():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(transition)
	tween.tween_property(self,"scale", Vector2(1,1), duration)
