extends Node3D

# Speed to modify the vec4 components
var speed: float = 0.05
var max_pos: float = 100.
var pos: Vector4

var square_sprite: Sprite2D;
var pos_label: Label3D

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

var keypoint_fig_path = {"jeff": "/root/square_3D/FigureSprites/JeffSprite"}
var keypoint_fig = {}

func _ready():
	square_sprite = $SquareMesh/SquareViewport/SquareSprite
	pos_label = $PositionLabel
	# Make sure the node has a material and that it's a ShaderMaterial
	assert(square_sprite.material is ShaderMaterial)
	pos = Vector4(1., 1., 1., 1.)
	pos_label.text = str(pos)
	square_sprite.material.set_shader_parameter("pos", pos)
	square_sprite.material.set_shader_parameter("max_pos", max_pos)
	for key in keypoint_fig_path:
		keypoint_fig[key] = get_node(keypoint_fig_path[key])

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
		var keypoint_dist = keypoint_pos[key].distance_to(pos)
		keypoint_fig[key].modulate.a = clamp(1. - keypoint_dist**2, 0., 1.)
		keypoint_fig[key].position.y = 0. - keypoint_dist**2
	square_sprite.material.set_shader_parameter("point_line_dists", point_line_dists)
	square_sprite.material.set_shader_parameter("pos", pos)
	pos_label.text = str(pos)


