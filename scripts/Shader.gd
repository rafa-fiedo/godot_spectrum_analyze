extends TextureRect

#export var input_name = "ShaderGlowOptions" # "ShaderCircleOptions"
var speed = 0
var radius = 0.01

func _ready():
	pass


func _on_HSlider_value_changed(value):
	if $CheckBox.pressed:
		$".".material.set_shader_param("radius", value)


func _on_HSlider2_value_changed(value):
	if $CheckBox.pressed:
		$".".material.set_shader_param("amount", value)


func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		$".".material.set_shader_param("radius", $HSlider.value)
		$".".material.set_shader_param("amount", $HSlider2.value)
	else:
		$".".material.set_shader_param("radius", 0.0)
		$".".material.set_shader_param("amount", 0.0)

func change_first_param(value):
	$".".material.set_shader_param("radius", value)
	
func change_second_param(value):
	$".".material.set_shader_param("amount", value)

func _process(delta):
	if speed != 0:
		radius += (radius * speed)
		$".".material.set_shader_param("radius", radius)
		
		if radius > 1.0:
			queue_free()
		
#	if Input.is_action_just_pressed(input_name):
#		var is_checked = $CheckBox.visible
#		$CheckBox.visible = !is_checked
#		$HSlider.visible = !is_checked
#		$HSlider2.visible = !is_checked
#
#		$CheckBox.show_on_top = !is_checked
#		$HSlider.show_on_top = !is_checked
#		$HSlider2.show_on_top = !is_checked
