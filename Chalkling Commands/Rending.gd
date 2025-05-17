class_name Rending
extends Command


const rotError := .2;

func _init(_duration:=0.0):
	pass
	
func _draw():
	var dis = self.transform.x.normalized() * 10
	draw_line(Vector2.ZERO - dis, Vector2.ZERO + dis, Color.WHITE, 5)

func getDur() -> float:
	return 0;

func run(_on: Chalkling) -> bool:
	return false
