extends Area2D


var logic = "" # I make the logic of the gate global 
# because the place holder needs to acces it to chack if it is correct
var lerping_speed : int = 10
var is_dragged = false # the button is not being dragged by default

func set_gate(_logic, _texture) -> void: 
	logic = _logic # The logic of the gate will be set when it is instanced
	$Sprite2D.texture = load(_texture) # The visual will be set depending on the logic

# making the dragging logic:


func _on_button_down() -> void:
	is_dragged = true

func _button_up() -> void:
	is_dragged = false

		
func _process(delta: float) -> void:
	if is_dragged:
		global_position = lerp(global_position, get_global_mouse_position(), lerping_speed*delta)
