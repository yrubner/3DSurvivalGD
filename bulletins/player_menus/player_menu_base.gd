extends Bulletin
class_name PlayerMenuBase

@onready var inventory_container: GridContainer = %InventoryContainer
@onready var item_description_label: Label = %ItemDescriptionLabel

func _enter_tree() -> void:
	EventSystem.INV_inventory_updated.connect(update_inventory_slots)

func _ready() -> void:
	EventSystem.PLA_freeze_player.emit()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	EventSystem.INV_ask_update_inventory.emit()
	
	for inventory_slot in inventory_container.get_children():
		inventory_slot.mouse_entered.connect(show_item_info.bind(inventory_slot))
		inventory_slot.mouse_exited.connect(hide_item_info)

func close() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	EventSystem.BUL_destroy_bulletin.emit(BulletinConfig.Keys.CraftingMenu)
	EventSystem.PLA_unfreeze_player.emit()

func show_item_info(inventory_slot : InventorySlot) -> void:
	var item_key = inventory_slot.item_key
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) or item_key == null:
		return
	
	var item_resource = ItemConfig.get_item_resource(item_key)
	
	item_description_label.text = item_resource.display_name + "\n" + item_resource.description

func hide_item_info() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return
	
	item_description_label.text = ""

func update_inventory_slots(inventory : Array) -> void:
	for i in inventory.size():
		inventory_container.get_child(i).set_item_key(inventory[i])
