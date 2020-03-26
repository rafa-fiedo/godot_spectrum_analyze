extends Node2D

var bip_length = 60 / 132.0
var first_timer = true

export(PackedScene) var circle_scene 

func _ready():
	pass
	
func _on_CircleRadius_value_changed(value):
	$ShaderCircle.change_first_param(value)

func _on_GlowRadius_value_changed(value):
	$Shader.change_first_param(value)

func _on_GlowAmount_value_changed(value):
	$Shader.change_second_param(value)

func _on_Timer_timeout():
	var circle_run = circle_scene.instance()
	circle_run.speed = 0.05
	add_child(circle_run)
	
	if first_timer:
		$Timer.start(bip_length * 4)
		first_timer = false 
	
func _process(delta):
	if Input.is_action_just_pressed("shader_options"):
		$HudOptions.visible = !$HudOptions.visible
	
	if Input.is_action_just_pressed("music_start"):
		$Timer.start(bip_length)




