extends Sprite2D

# Speed to modify the vec4 components
var speed: float = 0.05
var max_pos: float = 100.
var pos: Vector4

@onready var pos_label: Label = $Position

func _ready():
	# Make sure the node has a material and that it's a ShaderMaterial
	assert(self.material is ShaderMaterial)
	pos = Vector4(0, 0, 0, 0)
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

func modify_pos(index: int, amount: float):
	pos[index] = clamp(pos[index] + amount, 0.0, max_pos)
	pos_label.text = str(pos)
	self.material.set_shader_parameter("pos", pos)
