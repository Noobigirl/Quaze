extends Area2D

@export var logic = ""
var empty = true # used to make sure that only one gate is on it

func _on_area_entered(area: Area2D) -> void:
	await  area.area_entered # waits for the gate's code to finish first
	#debugging
	print("Entered area logic:", area.logic, ", instance id:", area.get_instance_id(), ", path:", area.get_path())
	if area.dropped: # only checking the logic of the gate that is inside
		# for some reason the logic of the gate is not defined
		print(area.logic)
		if area.logic == logic:
			
			print("valid gate")
		else :
			print("invalid gate")
			# make it emit a signal to signify that the gat is valid
			# or return a boolean
		empty = false
	
		# --for debugging puprposes
		#print("place holder is empty: " + str(empty))

func _on_area_exited(area: Area2D) -> void:
	if area.dropped: # checking if we are removing the same gate that was added
		empty = true # emptying the placehoder
		area.dropped = false  # setting drop stat back to false so that gate can be dropped again
		
		# --for debugging puposes:
		#print("Placehoder is empty: " + str(empty))
	# can be placed when the placeholder is free
