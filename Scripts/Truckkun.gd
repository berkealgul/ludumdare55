extends CharacterBody3D

signal player_dead()

var target = Vector3.ZERO

const SPEED = 300
const ROTATIONSPEED = 0.1

var spawn_pos = Vector3.ZERO	
var active = true

func _ready():
	spawn_pos = position
	
func _physics_process(delta):
	if not active:
		return 
		
	var p1 = Vector2(position.x, position.z)
	var p2 = Vector2(target.position.x, target.position.z)
	var steering = -(p1.angle_to_point(p2) - PI/2) * ROTATIONSPEED * delta
	var d = (p2-p1).normalized()
	velocity = SPEED * delta * Vector3(d.x, 0, d.y)
	look_at(target.position, Vector3.UP)
	rotate_y(PI)
	move_and_slide()

func _on_area_3d_body_entered(body):
	if active and body.is_in_group("Player"):
		player_dead.emit()
		active = false
		
func _on_player_restart_truck():
	active = true
	position = spawn_pos
