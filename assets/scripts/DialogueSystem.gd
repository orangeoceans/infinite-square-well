extends CanvasLayer

var dialogues = ["Hello my name is Jeff Goldblum.", "I am a famous actor who played Dr. Ian Malcolm in Jurassic Park.", "I must say you look quite ravishing today."]
var dialogue_index = 0
var dialogue_open = false
var char_per_sec = 20.
var text_tween

func update_dialogue():
	if dialogue_index < dialogues.size():
		$RichTextLabel.text = dialogues[dialogue_index]
		if text_tween:
			text_tween.kill()
		$RichTextLabel.visible_ratio = 0.
		text_tween = get_tree().create_tween()
		text_tween.tween_property($RichTextLabel, "visible_ratio", 1., len(dialogues[dialogue_index])/char_per_sec)
		dialogue_index += 1
	else:
		dialogue_index = 0
		$RichTextLabel.hide()
		await get_tree().create_timer(0.5).timeout
		$InteractButton.show()
		dialogue_open = false

var button_press_finished = true
func _on_button_pressed():
	if dialogue_open or not button_press_finished:
		return
	dialogue_open = true
	button_press_finished = false
	dialogue_index = 0
	$InteractButton.hide()
	$RichTextLabel.show()
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
			$RichTextLabel.visible_ratio = 1
		else:
			update_dialogue()
	input_finished = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
