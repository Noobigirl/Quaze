class_name base_path
extends Path2D

# This value represents your progress (0.0 = 0%, 1.0 = 100%)
var progress : float= 0.0
var path2d
var line2d

func _ready():
	path2d = self
	line2d = $Line2D
	update_progress_bar()
	
func update_progress_bar():
	var curve = path2d.curve
	var total_length = curve.get_baked_length()
	var current_length = total_length * progress
	var points = []

	var step = 2 # The distance between points along the curve (smaller = smoother line)
	var distance = 0.0
	while distance < current_length:
		points.append(curve.sample_baked(distance))
		distance += step

	# Add the last point exactly at the progress position
	if current_length > 0:
		points.append(curve.sample_baked(current_length))

	line2d.points = PackedVector2Array(points)

# Call this method to set progress (between 0.0 and 1.0)
func set_progress(value):
	progress = clamp(value, 0.0, 1.0)
	update_progress_bar()
	print("called")
