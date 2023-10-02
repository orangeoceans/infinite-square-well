extends Control

var root_node: Node3D
var intro_transition: TextureRect
var dialogue_button: Button

func _ready():
	root_node = get_node("/root/square_3D")
	intro_transition = get_node("../IntroTransition")
	dialogue_button = get_node("/root/square_3D/DialogueSystem/InteractButton")

func _process(_delta):
	pass

func _on_start_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property(intro_transition, "modulate", Color(1.,1.,1.,1.), 0.6)
	tween.tween_property(self, "modulate", Color(0,0,0,0), 0.2)
	tween.tween_property(intro_transition, "modulate", Color(1.,1.,1.,0.), 1.)
	await get_tree().create_timer(1.8).timeout
	root_node.can_move = true
	dialogue_button.disabled = false
	dialogue_button.show()
	intro_transition.queue_free()
	self.queue_free()

