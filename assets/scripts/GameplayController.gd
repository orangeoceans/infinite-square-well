extends Node3D

var speed: float = 0.05
var max_pos: float = 100.

@export var pos: Vector4
var last_pos: Vector4
var can_move: bool = true

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

var pos_tween

func _ready():
	square_sprite = $SquareMesh/SquareViewport/SquareSprite
	pos_label = $PositionLabel
	# Make sure the node has a material and that it's a ShaderMaterial
	assert(square_sprite.material is ShaderMaterial)
	pos = Vector4(1., 1., 1., 1.)
	last_pos = pos
	pos_label.text = str(pos)
	square_sprite.material.set_shader_parameter("pos", pos)
	square_sprite.material.set_shader_parameter("max_pos", max_pos)
	for key in keypoint_fig_path:
		keypoint_fig[key] = get_node(keypoint_fig_path[key])
	update_square()

func _process(_delta):
	can_move = not $DialogueSystem.dialogue_open
	if can_move:
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
	
	if pos != last_pos:
		update_square()
		last_pos = pos

func point_line_distance(point: Vector4, line_p: Vector4, line_v: Vector4) -> float:
	# Project point onto line, then calculate distance
	var v: Vector4 = point - line_p
	var closest_p: Vector4 = line_p + line_v * v.dot(line_v)
	return clamp(closest_p.distance_to(point), 0.0, 1.0)

func modify_pos(index: int, amount: float):
	pos[index] = clamp(pos[index] + amount, 0.0, max_pos)
	
func update_square():
	var point_line_dists = []
	var nearest_encounter = ""
	var nearest_encounter_dist = 9999999
	for key in keypoint_pos:
		point_line_dists.append(
			Vector3(
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][0]),
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][1]),
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][2]),
			)
		)
		var keypoint_dist = keypoint_pos[key].distance_to(pos)
		if keypoint_dist < nearest_encounter_dist and key in $DialogueSystem.encounter_text:
			nearest_encounter_dist = keypoint_dist
			nearest_encounter = key
		keypoint_fig[key].modulate.a = clamp(1. - keypoint_dist**2, 0., 1.)
		keypoint_fig[key].position.y = 0. - keypoint_dist**2
	$DialogueSystem.nearest_encounter = nearest_encounter
	$DialogueSystem.nearest_encounter_dist = nearest_encounter_dist
	
	square_sprite.material.set_shader_parameter("point_line_dists", point_line_dists)
	square_sprite.material.set_shader_parameter("pos", pos)
	pos_label.text = "%.2f %.2f %.2f %.2f" % [pos[0], pos[1], pos[2], pos[3]]

func _on_interact_button_pressed():
	if $DialogueSystem.can_talk:
		pos_tween = get_tree().create_tween()
		pos_tween.tween_property(self, "pos", keypoint_pos[$DialogueSystem.nearest_encounter], 0.3)
