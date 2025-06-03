extends Area2D

var logic = ""
var empty = true # used to make sure that only one gate is on it

func _on_area_entered(area: Area2D) -> void:
	await  area.area_entered # waits for the gate's code to finish first
	if area.dropped: # only checking the logic of the gate that is inside
		if area.logic == logic:
			print("valid gate")
		else :
			print("invalid gate")
			# make it emit a signal to signify that the gat is valid
			# or return a boolean
		empty = false
		
		# for debugging puprposes
		print("place holder is empty: " + str(empty))

func _on_area_exited(area: Area2D) -> void:
	if area.dropped: # checking if we are removing the smae gate that was added
		empty = true # emptying the placehoder
		area.dropped = false  # setting drop stat back to false so that gate can be dropped again
		
		# for debuggin puposes:
		print("Placehoder is empty: " + str(empty))
	# can be placed when the placeholder is free
