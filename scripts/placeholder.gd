extends Area2D

var logic = ""
var is_droppable = false # cannot be dropped, but things are dropped init
var empty = true # used to make sure that only one gate is on it

func _on_area_entered(area: Area2D) -> void:
	await  area.area_entered # waits for the gate's code to finish first
	if area.logic == logic:
		print("valid gate")
	else :
		print("invalid gate")
		# make it emit a signal to signify that the gat is valid
		# or return a boolean
	empty = false
	

func _on_area_exited(area: Area2D) -> void:
	if area.dropped: # checking if we are removing the smae gate that was added
		empty = true # setting dropped back to false so that gates
	# can be placed when the placeholder is free
