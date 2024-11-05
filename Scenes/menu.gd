extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")

func _on_player_pressed():
	pass

func _on_quit_pressed():
	get_tree().quit()