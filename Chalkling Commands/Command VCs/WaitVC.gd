class_name WaitVC
extends Wait

func _init(duration:=0.0):
	time = duration
	
	var shape = CircleShape2D.new()
	shape.radius = 10.0
	
	collision_shape.shape = shape
	add_child(collision_shape)
	collision_shape.position = Vector2.ZERO
	collision_layer = 1
	collision_mask = 0

func _draw():
	var dis = self.transform.x.normalized() * 10
	draw_line(Vector2.ZERO - dis, Vector2.ZERO + dis, Color.WHITE, 5)
	draw_string(ThemeDB.fallback_font, Vector2.ZERO + Vector2(-12, 28), "%.1f" % time)
