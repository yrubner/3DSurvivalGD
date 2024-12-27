extends Bulletin

func _ready() -> void:
	EventSystem.PLA_freeze_player.emit()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func close() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	EventSystem.BUL_destroy_bulletin.emit(BulletinConfig.Keys.CraftingMenu)
	EventSystem.PLA_unfreeze_player.emit()
