extends Node

@onready var player = get_tree().get_current_scene().get_node("Player")
@onready var truck = get_tree().get_current_scene().get_node("Truck")

func _ready():
	truck.target = player

func _on_timer_timeout():
	pass
	#var t = truck.duplicate(8)
	#add_child(t)
