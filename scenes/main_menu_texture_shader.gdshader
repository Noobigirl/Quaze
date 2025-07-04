shader_type canvas_item;

uniform float speed = .8;

void vertex() {
	UV.y -= TIME * speed;
}


//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
