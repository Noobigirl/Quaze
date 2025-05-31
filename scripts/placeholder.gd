extends Node2D
var logic = ""
func  _is_gate_validated():
	# check if the logic of the node is corresponding to the logic of the expression
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.logic == logic:
		print("valid gate")
		# make it emit a signal to signify that the gat is valid
		# or return a boolean
