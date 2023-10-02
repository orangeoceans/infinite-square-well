extends Node2D

var muted = false
var master_volume
var current_stream
var dialogue_system
var min_volume = -80.
var audible_dist = 7.

var keypoint_streams = {
	"statue": $lofi,
	"trumpet": $trumpet,
	"salt": $chime
}

func linear_to_log(linear):
	if linear <= 0:
		return -80.0 # a very low value to represent silence
	else:
		return clamp(20 * log(linear) / log(10), -80.0, 0.)

var prev_dist = 999999
func update_audio():
	var key = dialogue_system.nearest_encounter
	var dist = dialogue_system.nearest_encounter_dist
	if dist != prev_dist and dist <= audible_dist and key in keypoint_streams:
		current_stream = keypoint_streams[key]
		if not current_stream.playing:
			current_stream.playing = true
		var normalized_dist = dist/audible_dist
	
		$ambience.volume_db = linear_to_log(normalized_dist)
		current_stream.volume_db = linear_to_log(1. - normalized_dist)
		prev_dist = dist
	elif dist != prev_dist:
		if current_stream:
			current_stream.playing = false
			current_stream = null
		$ambience.volume_db = master_volume
	

func start_audio():
	$ambience.play()

func _ready():
	master_volume = -20.
	dialogue_system = get_node("/root/square_3D/DialogueSystem")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_audio()
	print(master_volume)
	print($ambience.volume_db)
