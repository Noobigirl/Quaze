extends Area2D

var logic = ""
var is_droppable = false # cannot be dropped, but things are dropped init

func _on_area_entered(area: Area2D) -> void:
	if area.logic == logic:
		print("valid gate")
	else :
		print("invalid gate")
		# make it emit a signal to signify that the gat is valid
		# or return a boolean
