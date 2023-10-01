extends Sprite2D

# Speed to modify the vec4 components
var speed: float = 0.05

@onready var pos_label: Label = $Position

func _ready():
	# Make sure the node has a material and that it's a ShaderMaterial
	assert(self.material is ShaderMaterial)
	pos_label.text = str(self.material.get_shader_parameter("pos"))

func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		modify_shader_pos(0, speed)
	elif Input.is_key_pressed(KEY_A):
		modify_shader_pos(0, -speed)
		
	if Input.is_key_pressed(KEY_W):
		modify_shader_pos(1, speed)
	elif Input.is_key_pressed(KEY_S):
		modify_shader_pos(1, -speed)

	if Input.is_key_pressed(KEY_E):
		modify_shader_pos(2, speed)
	elif Input.is_key_pressed(KEY_D):
		modify_shader_pos(2, -speed)
		
	if Input.is_key_pressed(KEY_R):
		modify_shader_pos(3, speed)
	elif Input.is_key_pressed(KEY_F):
		modify_shader_pos(3, -speed)

func modify_shader_pos(index: int, amount: float):
	var pos: Vector4 = self.material.get_shader_parameter("pos")
	pos[index] += amount
	pos_label.text = str(pos)
	self.material.set_shader_parameter("pos", pos)
