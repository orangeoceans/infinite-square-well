extends Control

var root_node: Node3D
var intro_transition: TextureRect
var dialogue_button: Button
var camera: Camera3D
var BGM: Node2D

func _ready():
	root_node = get_node("/root/square_3D")
	intro_transition = get_node("../IntroTransition")
	dialogue_button = get_node("/root/square_3D/DialogueSystem/InteractButton")
	camera = get_node("/root/square_3D/Camera3D")
	BGM = get_node("/root/square_3D/BGM")

func _process(_delta):
	pass

func _on_start_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property(intro_transition, "modulate", Color(1.,1.,1.,1.), 0.6)
	tween.tween_property(self, "modulate", Color(0,0,0,0), 0.2)
	tween.tween_property(intro_transition, "modulate", Color(1.,1.,1.,0.), 1.)
	BGM.start_audio()
	var audio_tween = get_tree().create_tween()
	audio_tween.tween_property(BGM, "master_volume", 0, 0.8)
	await get_tree().create_timer(0.8).timeout
	var camera_tween = get_tree().create_tween().set_parallel(true)
	camera_tween.tween_property(camera, 
		"position", Vector3(0., 1.64, 1.32), 1.0
	).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	camera_tween.tween_property(camera, 
		"rotation", Vector3(-1.17, 0., 0.), 1.0
	).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	await get_tree().create_timer(1.0).timeout
	root_node.can_move = true
	dialogue_button.disabled = false
	dialogue_button.show()
	intro_transition.queue_free()
	self.queue_free()

