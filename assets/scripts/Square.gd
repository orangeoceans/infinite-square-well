extends Sprite2D

# Speed to modify the vec4 components
var speed: float = 0.05
var max_pos: float = 100.
var pos: Vector4

@export var pos_label: Label3D

var keypoint_pos = {
	"jeff": Vector4(1., 1., 1., 1.)
}

var keypoint_vec = {
	"jeff": [
		Vector4(1., 0., 0., 0.),
		Vector4(0., 1., 0., 0.),
		Vector4(0., 0., 1., 1.).normalized(),
	]
}

func _ready():
	# Make sure the node has a material and that it's a ShaderMaterial
	assert(self.material is ShaderMaterial)
	pos = Vector4(1., 1., 1., 1.)
	pos_label.text = str(pos)
	self.material.set_shader_parameter("pos", pos)
	self.material.set_shader_parameter("max_pos", max_pos)

func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		modify_pos(0, speed)
	elif Input.is_key_pressed(KEY_A):
		modify_pos(0, -speed)
		
	if Input.is_key_pressed(KEY_W):
		modify_pos(1, speed)
	elif Input.is_key_pressed(KEY_S):
		modify_pos(1, -speed)

	if Input.is_key_pressed(KEY_E):
		modify_pos(2, speed)
	elif Input.is_key_pressed(KEY_D):
		modify_pos(2, -speed)
		
	if Input.is_key_pressed(KEY_R):
		modify_pos(3, speed)
	elif Input.is_key_pressed(KEY_F):
		modify_pos(3, -speed)

func point_line_distance(point: Vector4, line_p: Vector4, line_v: Vector4) -> float:
	# Project point onto line, then calculate distance
	var v: Vector4 = point - line_p
	var closest_p: Vector4 = line_p + line_v * v.dot(line_v)
	return clamp(closest_p.distance_to(point), 0.0, 1.0)

func modify_pos(index: int, amount: float):
	pos[index] = clamp(pos[index] + amount, 0.0, max_pos)
	
	var point_line_dists = []
	for key in keypoint_pos:
		point_line_dists.append(
			Vector3(
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][0]),
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][1]),
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][2]),
			)
		)
	self.material.set_shader_parameter("point_line_dists", point_line_dists)
	self.material.set_shader_parameter("pos", pos)
	pos_label.text = str(pos)
