extends Control

signal restart()

func _on_res_button_down():
	restart.emit()
