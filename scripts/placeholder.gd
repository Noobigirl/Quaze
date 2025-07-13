extends Area2D
@export var logic = ""
var valid: bool = false # used to dispblay gameover screen
#var animate_circuit: bool = false # checking if we can animate
var empty:bool = true # used to make sure that only one gate is on it

func _on_area_entered(area: Area2D) -> void:
	await  area.area_entered # waits for the gate's code to finish first
	if area.dropped: # only checking the logic of the gate that is inside
		$AudioStreamPlayer.play()
		empty = false
		# --- for debugging purposes
		# print("Entered area logic:", area.logic, ", instance id:", area.get_instance_id(), ", path:")
		print(area.logic)
		if area.logic == logic:
			print("valid gate")
			valid = true
			GlobalGates.has_won.emit()
		else :
			print("invalid gate")
		GlobalGates.gate_placed.emit(self)
		#print("place holder is empty: " + str(empty))

func _on_area_exited(area: Area2D) -> void:
	if area.dropped: # checking if we are removing the same gate that was added
		empty = true # emptying the placehoder
		area.dropped = false  # setting drop value back to false so that gate can be dropped again
		valid = false
		#animate_circuit = false
		
		# --- for debugging puposes:
		#print("Placehoder is empty: " + str(empty))
	
