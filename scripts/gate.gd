extends Area2D

@onready var boundary = get_viewport_rect().size
@onready var size = $CollisionShape2D.shape # getting a Shape2D 
@onready var collision = $CollisionShape2D.disabled
@onready var default_scale = get_global_scale() # storing the default scaling of the sprite
@export var texture: String # accessing the texture of the gate for the toolbar

# --- initialisation of the script-wide variables
var logic:String= "none"# logic later set with set_gate()
var lerping_speed : int = 10
var is_dragged = false # the button is not being dragged by default
var dropped = false # the gate is not dropped by default


# --- helper function to set the logic of the gate and its texture
func set_gate(_logic, _texture) -> void: 
	logic = _logic # The logic of the gate will be set when it is instanced
	texture = _texture
	$Label.text = _logic # for debugging purposes
	$Sprite2D.texture = load(texture) # The visual will be set depending on the logic
	
	#debugging
	print("Setting gate logic to:", logic, ", instance id:", self.get_instance_id(), ", path:", self.get_path())

# --- making the dragging logic:
func _on_button_down() -> void:
	is_dragged = true
	GlobalGates.is_dragging = true # so that we cannot drag or make hovering effect on the other gates
	set_global_scale(Vector2(0.9, 0.9)) # downscaling the sprite to give a dragging impression

func _button_up() -> void:
	GlobalGates.is_dragging = false
	is_dragged = false
	set_global_scale(default_scale)

# --- creating a hover effect when no gate is being dragged
func _on_mouse_entered() -> void:
	if not GlobalGates.is_dragging:
		set_global_scale(Vector2(0.95, 0.95))

func _on_mouse_exited() -> void:
	if not GlobalGates.is_dragging:
		set_global_scale(default_scale)
		
# --- handling the dropping
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("placeholder"):
		if  area.empty: # making sure it is only dropped in a designated space
			dropped = true
			var tween = get_tree().create_tween()
			is_dragged = false # stopping the dragging
			# the scenes all have the same parent
			# so it doesn't really matter if you usde gobal_position or not
			tween.tween_property(self, "position", area.position, 0.1)

		# --- When we drop the gate back to the slot

func _process(delta: float) -> void:
	if is_dragged: # whe only want the gate we selected to be moved
		# linear interpolation 
		global_position = lerp(global_position, get_global_mouse_position(), lerping_speed*delta)
		
		global_position = global_position.clamp(Vector2.ZERO, boundary- size.get_rect().size)
		# The get_rect() returns a rect2d of the shape
		# size returns a vector representing the diagonal of the shape
		# I substract this vector from the te boundary so that the edge of the gate
		# doesn't go off screen
