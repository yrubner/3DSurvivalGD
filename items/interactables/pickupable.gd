extends Interactable
class_name Pickupable

@export var item_key : ItemConfig.Keys

@onready var parent : Node3D = get_parent()

func start_interaction() -> void:
	parent.queue_free()
