class_name Chalkling
extends Area2D

var moveS : int = 1
var rotS : float = .1
var inst : Array[Command] = []
var collision_shape = CollisionShape2D.new()

func _init(instruction : Command = null):
	inst.append(Wait.new(.05))
	if(instruction):
		if inst.get_typed_class_name() == "Rending":
			collision_mask |= 8
			collision_layer|= 8
		else:
			inst.append(instruction);
	
	var shape = CircleShape2D.new()
	shape.radius = 10.0
	
	collision_shape.shape = shape
	add_child(collision_shape)
	collision_shape.position = Vector2.ZERO
	collision_layer = 2
	collision_mask = 7

	# Optional: turn on monitoring (should be on by default)
	monitoring = true
	monitorable = true

func _draw():
	draw_circle(Vector2.ZERO, 10.0, Color.RED)

	# Compute the direction the node is facing
	var facing_dir = Vector2.RIGHT.rotated(rotation)  # Local +X
	# Calculate the edge position for the indicator
	var indicator_pos = facing_dir * 10
	# Draw the directional dot
	draw_circle(indicator_pos, 2.0, Color.WHITE)
	
func append(instruction: Command):
	if inst:
		if inst.get_typed_class_name() == "Rending":
			collision_mask |= 8;
		else:
			inst.append(instruction);


func execute():
	await get_tree().process_frame
	var ii := 0; 
	while(ii < inst.size()):
		var command := inst[ii]
		while command.run(self) :
			await get_tree().process_frame 
		var time_elapsed := 0.0
		while time_elapsed < command.getDur() :
			while command.run(self) : #Note: Required. Ex. Wants to move through a rithmatic line. See scene where they test the weird chalk symbol on the wall. 
				await get_tree().process_frame 
			await get_tree().process_frame 
			time_elapsed += get_process_delta_time()
		ii+=1;

func attack(on: Object):
	if on.collision_layer & 7:
		on.queue_free()
	else:
		pass


func wayObstructed(distance: float) -> Object:
	#return null;
	var space_state = get_world_2d().direct_space_state

	# Facing direction is local +X rotated by rotation
	var origin = global_position
	var direction = transform.x.normalized()
	var to = origin + direction * distance

	var query = PhysicsRayQueryParameters2D.create(origin, to)
	query.collision_mask = 0xFFFFFFFF
	query.exclude = [self]  # Don't collide with self
	query.collide_with_areas = true
	query.collide_with_bodies = true

	var result = space_state.intersect_ray(query)

	if result:
		return result.collider  # This is the object hit
	else:
		return null
