class_name TurnVC
extends Turn

func _init(rotationIn:= .5 * PI):
	rot = rotationIn
	
	var shape = CircleShape2D.new()
	shape.radius = 10.0
	
	collision_shape.shape = shape
	add_child(collision_shape)
	collision_shape.position = Vector2.ZERO
	collision_layer = 1
	collision_mask = 0

func _draw():
	var mid = -self.transform.y.normalized() * 10
	var width = self.transform.x.normalized() * 10
	var wingW = self.transform.x.normalized() * 5
	var wingH = self.transform.y.normalized() * 5
	draw_line(Vector2.ZERO - mid, Vector2.ZERO+mid-width, Color.WHITE, 3)
	draw_line(Vector2.ZERO + mid - width, Vector2.ZERO + mid + width, Color.WHITE, 3)
	draw_line(Vector2.ZERO + mid + width, Vector2.ZERO + mid + width - wingW - wingH, Color.WHITE, 3)
	draw_line(Vector2.ZERO + mid + width, Vector2.ZERO + mid + width - wingW + wingH, Color.WHITE, 3)
	
	draw_string(ThemeDB.fallback_font, Vector2.ZERO + Vector2(-12, 28), "%.2f" % rot)
