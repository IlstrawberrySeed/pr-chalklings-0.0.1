class_name GoVC
extends Go

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
	var dis = self.transform.y.normalized() * 10
	var wingL = self.transform.y.normalized() * 5 + self.transform.x.normalized() * 5
	var wingR = self.transform.y.normalized() * 5 - self.transform.x.normalized() * 5
	draw_line(Vector2.ZERO - dis, Vector2.ZERO+dis, Color.WHITE, 3)
	draw_line(Vector2.ZERO - dis, Vector2.ZERO - dis + wingL, Color.WHITE, 3)
	draw_line(Vector2.ZERO - dis, Vector2.ZERO - dis + wingR, Color.WHITE, 3)
	
	draw_string(ThemeDB.fallback_font, Vector2.ZERO + Vector2(-12, 28), "%.1f" % time)
