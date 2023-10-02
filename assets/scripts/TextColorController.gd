extends RichTextLabel

var raw_text: String
var light_color = "#4f4f4f"
var dark_color = "#c0c0c0"
var theme_toggle: CheckButton

func _ready():
	theme_toggle = get_node("/root/square_3D/HUD/ThemeToggle")
	raw_text = self.text
	update_text()

func _process(_delta):
	pass

func update_text():
	self.bbcode_text = (("[color=%s]" % [dark_color])+raw_text+"[/color]" 
		if theme_toggle.button_pressed 
		else ("[color=%s]" % [light_color])+raw_text+"[/color]")
	self.parse_bbcode(self.text)

func _on_theme_toggle_toggled(_button_pressed):
	update_text()

