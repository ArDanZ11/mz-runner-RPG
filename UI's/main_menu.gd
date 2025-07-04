extends Control
@onready var menu_music: AudioStreamPlayer = $MenuMusic
@onready var isplaying = true
@onready var ispaused = false
var stream_paused = false

func _ready() -> void:
	menu_music.play()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credtis_pressed() -> void:
	get_tree().change_scene_to_file("res://UI's/credits_ui.tscn")


func _on_sound_button_pressed() -> void:
	if isplaying:
		isplaying = false
		ispaused = true
		menu_music.stop()
		
func save():
	if isplaying:
		isplaying = false
		ispaused = true
		menu_music.stop()
	

	if ispaused:
		isplaying = true
		ispaused = false
		menu_music.play()
		
