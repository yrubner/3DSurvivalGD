class_name ItemConfig

enum Keys {
	# pickupables
	Stick,
	Stone,
	Plant,
	Mushroom,
	Fruit,
	Log,
	Coal,
	Flintstone,
	RawMeat,
	CookedMeat,
	
	# craftables
	Axe,
	Pickaxe,
	Campfire,
	Multitool,
	Rope,
	Tinderbox,
	Torch,
	Tent,
	Raft
	
}

const CRAFTABLE_ITEM_KEYS : Array[Keys] = [
	Keys.Axe,
	#Keys.Pickaxe,
	#Keys.Campfire,
	#Keys.Multitool,
	Keys.Rope,
	#Keys.Tinderbox,
	#Keys.Torch,
	#Keys.Tent,
	#Keys.Raft
]

const ITEM_RESOURCE_PATHS = {
	Keys.Stick : "res://resources/item_resources/stick_resource.tres",
	Keys.Stone : "res://resources/item_resources/stone_resource.tres",
	Keys.Plant : "res://resources/item_resources/plant_resource.tres",
	Keys.Axe : "res://resources/item_resources/axe_resource.tres",
	Keys.Rope : "res://resources/item_resources/rope_resource.tres"
}

static func get_item_resource(key : Keys) -> ItemResource:
	return load(ITEM_RESOURCE_PATHS.get(key))
	

const CRAFTING_BLUEPRINT_RESOURCE_PATHS = {
	Keys.Axe : "res://resources/crafting_blueprint_resources/axe_blueprint.tres",
	Keys.Rope : "res://resources/crafting_blueprint_resources/rope_blueprint.tres"
}

static func get_crafting_blueprint_resource(key : Keys) -> CraftingBlueprintResource:
	return load(CRAFTING_BLUEPRINT_RESOURCE_PATHS.get(key))
