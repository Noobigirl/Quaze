extends Node2D

var logic = "AND"
# Called when the node enters the scene tree for the first time.



func _ready() -> void:
	$Label.text = "A +" + logic + "B"
	$Node2D.logic = logic
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print($Gate.logic == logic)
	pass
