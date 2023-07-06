@tool
extends EditorPlugin


const timer = preload("res://addons/death_timer/Timer.tscn")
var t = null


func _enter_tree():
	# Initialization of the plugin goes here.
	t = timer.instantiate();
	add_control_to_container(CONTAINER_TOOLBAR, t)
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	t.queue_free()
	pass

func _init_timer():
	pass
