extends Resource
class_name ItemData

# =============================================================================
# ITEM DATA
# Base definition for any item in the game.
# Lives as a .tres file in res://resources/items/
#
# This is pure DATA — no logic, no inventory behavior.
# The inventory system reads from this; it does not live inside it.
# =============================================================================


# -----------------------------------------------------------------------------
# IDENTITY
# -----------------------------------------------------------------------------
@export_group("Identity")
@export var item_name: String = ""
@export var description: String = ""
@export var icon: Texture2D


# -----------------------------------------------------------------------------
# PROPERTIES
# -----------------------------------------------------------------------------
@export_group("Properties")
@export var max_stack_size: int = 1          # 1 = not stackable.
@export var is_consumable: bool = false
@export var is_droppable: bool = true


# -----------------------------------------------------------------------------
# CATEGORY
# -----------------------------------------------------------------------------
@export_group("Category")
@export_enum("Misc", "Weapon", "Armor", "Consumable", "Material", "Quest") \
	var category: int = 0
