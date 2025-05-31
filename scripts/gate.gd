extends Area2D

var logic = "" # I make the logic of the gate global 
# because the place holder needs to acces it to chack if it is correct
func set_gate(_logic, _texture) -> void: 
	logic = _logic # The logic of the gate will be set when it is instanced
	$Sprite2D.texture = load(_texture) # The visual will be set depending on the logic
