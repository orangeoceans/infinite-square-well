extends Node3D

var speed: float = 0.05
var max_pos: float = 100.

@export var pos: Vector4
var center_pos: Vector4 = Vector4(50., 50., 50., 50.)
var last_pos: Vector4

var can_move: bool = false
var tutorial: bool = true

var square_sprite: Sprite2D;
var pos_label: Label3D

var keypoints = ["statue", "trumpet"]

var keypoint_pos = {
	"statue": Vector4(50., 50., 50., 50.),
	"trumpet": Vector4(50., 50., 73., 50.)
}

var keypoint_vec = {
	"statue": [
		Vector4(1., 0., 0., 0.),
		Vector4(0., 1., 0., 0.),
		Vector4(0., 0., 1., 0.),
	],
	"trumpet": [
		Vector4(0., 0., 1., 0.),
		Vector4(0., 0., 0., 1.),
		Vector4(1., 0., 0., 0.),
	]
}

var keypoint_fig_path = {
	"statue": "/root/square_3D/FigureSprites/StatueSprite",
	"trumpet": "/root/square_3D/FigureSprites/TrumpetSprite"}
var keypoint_fig = {}

var pos_tween
var button_tween

func end_tutorial():
	tutorial = false
	$HUD/DialRectX.show()
	$HUD/DialRectY.show()
	$HUD/DialRectZ.show()
	$HUD/DialRectW/IndicatorRect.queue_free()

func _ready():
	square_sprite = $SquareMesh/SquareViewport/SquareSprite
	pos_label = $PositionLabel
	# Make sure the node has a material and that it's a ShaderMaterial
	assert(square_sprite.material is ShaderMaterial)
	pos = Vector4(30., 50., 50., 50.)
	last_pos = pos
	pos_label.text = str(pos)
	square_sprite.material.set_shader_parameter("pos", pos)
	square_sprite.material.set_shader_parameter("max_pos", max_pos)
	for key in keypoint_fig_path:
		keypoint_fig[key] = get_node(keypoint_fig_path[key])
	update_square()

func _process(_delta):
	if tutorial:
		if $DialogueSystem.encounter_flags["statue"] != "start":
			end_tutorial()
	if can_move and not $DialogueSystem.dialogue_open:
		if Input.is_key_pressed(KEY_Q):
			modify_pos(0, speed)
		elif Input.is_key_pressed(KEY_A):
			modify_pos(0, -speed)

		if not tutorial:
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
	for key in keypoints:
		point_line_dists.append(
			Vector3(
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][0]),
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][1]),
				point_line_distance(pos, keypoint_pos[key], keypoint_vec[key][2]),
			)
		)
		var keypoint_dist = keypoint_pos[key].distance_to(pos)
		if keypoint_dist < nearest_encounter_dist and key in $DialogueSystem.all_encounter_text:
			nearest_encounter_dist = keypoint_dist
			nearest_encounter = key
		keypoint_fig[key].modulate.a = clamp(1. - keypoint_dist**2, 0., 1.)
		keypoint_fig[key].position.y = 0.83 - keypoint_dist**1.5
	$DialogueSystem.nearest_encounter = nearest_encounter
	$DialogueSystem.nearest_encounter_dist = nearest_encounter_dist
	if nearest_encounter_dist <= $DialogueSystem.speak_dist:
		square_sprite.material.set_shader_parameter("near_key_index", keypoints.find(nearest_encounter))
	else:
		square_sprite.material.set_shader_parameter("near_key_index", -1)
	square_sprite.material.set_shader_parameter("point_line_dists", point_line_dists)
	square_sprite.material.set_shader_parameter("pos", pos)
	pos_label.text = "%.2f %.2f %.2f %.2f" % [pos[0], pos[1], pos[2], pos[3]]

func _on_interact_button_pressed():
	if $DialogueSystem.can_talk:
		pos_tween = get_tree().create_tween()
		pos_tween.tween_property(self, "pos", keypoint_pos[$DialogueSystem.nearest_encounter], 0.3)

func _on_theme_toggle_toggled(button_pressed):
	if button_pressed:
		$HUD/ThemeToggle.material.set_shader_parameter("dark_mode", true)
		$Camera3D.environment.background_color = Color("#414141")
	else:
		$HUD/ThemeToggle.material.set_shader_parameter("dark_mode", false)
		$Camera3D.environment.background_color = Color("#FAFAFA")

func _on_recenter_button_pressed():
	if $DialogueSystem.dialogue_open:
		return
	can_move = false
	pos_tween = get_tree().create_tween()
	pos_tween.tween_property(self, "pos", center_pos, 0.5)
	await get_tree().create_timer(0.5).timeout
	can_move = true
