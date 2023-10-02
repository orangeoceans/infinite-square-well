extends TextureRect

@export var pos_index: float

var min_angle = -135.
var max_angle = 135.
var diff_angle = max_angle - min_angle

var root_node;

func update_dial(val):
	var normalized_val = val/root_node.max_pos
	$NeedleRect.rotation_degrees = min_angle + diff_angle*normalized_val
	$ValueLabel.raw_text = "[code]%05d[/code]" % [val*100.]
	$ValueLabel.update_text()

func _ready():
	root_node = get_node("/root/square_3D")
	var val = root_node.pos[pos_index]
	update_dial(val)
	
var prev_val = 0
func _process(_delta):
	var val = root_node.pos[pos_index]
	if val != prev_val:
		update_dial(val)
		prev_val = val
