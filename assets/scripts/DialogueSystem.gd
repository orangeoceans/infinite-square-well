extends CanvasLayer

@export var nearest_encounter: String
@export var nearest_encounter_dist: float

var can_talk = false
var all_encounter_text
var encounter_flags
var dialogue_index = 0
var dialogue_open = false
var char_per_sec = 40.
var speak_dist = 0.75
var text_tween
var button_tween
var camera_tween
var dialogue_tween

var camera: Camera3D

func end_dialogue():
	dialogue_index = 0
	if dialogue_tween:
		dialogue_tween.kill()
	dialogue_tween = get_tree().create_tween().set_parallel(true)
	dialogue_tween.tween_property($DialogueRichtext, "position", Vector2(48,890), 0.2)
	dialogue_tween.tween_property($DialogueRichtext, "modulate", Color(1,1,1,0), 0.2)
	if camera_tween:
		camera_tween.kill()
	camera_tween = get_tree().create_tween().set_parallel(true)
	camera_tween.tween_property(camera, 
		"position", Vector3(0., 1.64, 1.32), 0.3
	)
	camera_tween.tween_property(camera, 
		"rotation", Vector3(-1.17, 0., 0.), 0.3
	)
	await get_tree().create_timer(0.3).timeout
	if button_tween:
		button_tween.kill()
	button_tween = get_tree().create_tween()
	button_tween.tween_property($InteractButton, "modulate", Color(1,1,1,1), 0.2)
	await get_tree().create_timer(0.2).timeout
	dialogue_open = false

func update_dialogue():
	var encounter_text = all_encounter_text[nearest_encounter][encounter_flags[nearest_encounter]][dialogue_index]
	if encounter_text is String:
		$DialogueRichtext.text = encounter_text
		if text_tween:
			text_tween.kill()
		$DialogueRichtext.visible_ratio = 0.
		text_tween = get_tree().create_tween()
		text_tween.tween_property($DialogueRichtext, 
			"visible_ratio", 1., 
			len(encounter_text)/char_per_sec
		)
		dialogue_index += 1
	else:
		for encounter in encounter_text:
			encounter_flags[encounter] = encounter_text[encounter]
		end_dialogue()


var button_press_finished = true
func _on_button_pressed():
	if dialogue_open or not button_press_finished or not can_talk:
		return
	dialogue_open = true
	button_press_finished = false
	dialogue_index = 0
	if button_tween:
		button_tween.kill()
	button_tween = get_tree().create_tween()
	button_tween.tween_property($InteractButton, "modulate", Color(1,1,1,0), 0.2)
	if dialogue_tween:
		dialogue_tween.kill()
	dialogue_tween = get_tree().create_tween().set_parallel(true)
	dialogue_tween.tween_property($DialogueRichtext, "position", Vector2(48,550), 0.3)
	dialogue_tween.tween_property($DialogueRichtext, "modulate", Color(1,1,1,1), 0.3)
	if camera_tween:
		camera_tween.kill()
	camera_tween = get_tree().create_tween().set_parallel(true)
	camera_tween.tween_property(camera, 
		"position", Vector3(0., 0.85, 1.05), 0.5
	)
	camera_tween.tween_property(camera, 
		"rotation", Vector3(-0.8, 0., 0.), 0.5
	)
	update_dialogue()
	button_press_finished = true

var input_finished = true
func _input(event):
	if not input_finished or not dialogue_open:
		return
	input_finished = false
	if event.is_action_pressed("advance_dialogue"):
		if text_tween.is_running():
			text_tween.kill()
			$DialogueRichtext.visible_ratio = 1
		else:
			update_dialogue()
	input_finished = true

func _ready():
	nearest_encounter = ""
	camera = get_node("/root/square_3D/Camera3D")
	all_encounter_text = $EncounterText.all_encounter_text
	encounter_flags = {}
	for key in all_encounter_text:
		encounter_flags[key] = "start"
	print(encounter_flags)

func _process(_delta):
	var dialogue_to_enable = (nearest_encounter_dist <= speak_dist)
	if can_talk != dialogue_to_enable:
		if button_tween:
			button_tween.kill()
		button_tween = get_tree().create_tween()
		button_tween.tween_property($InteractButton, "modulate", Color(1, 1, 1, int(dialogue_to_enable)), 0.3)
	can_talk = dialogue_to_enable
