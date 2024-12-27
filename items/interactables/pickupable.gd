extends Interactable
class_name Pickupable

@export var item_key : ItemConfig.Keys

@onready var parent : Node3D = get_parent()

func start_interaction() -> void:
	EventSystem.INV_try_to_pickup_item.emit(item_key, destroy_pickupable)

func destroy_pickupable() -> void:
	parent.queue_free()
