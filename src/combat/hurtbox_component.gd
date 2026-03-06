extends Area2D
class_name HurtboxComponent

# =============================================================================
# HURTBOX COMPONENT
# Attached to anything that CAN RECEIVE damage — characters, destructibles.
# Listens for incoming HitboxComponents and routes damage to its owner entity.
#
# Usage:
#   - Add as child node to any entity that can take damage
#   - Assign entity_owner to the Entity node that owns this hurtbox
#   - Damage flows: Hitbox → Hurtbox → entity_owner.take_damage()
# =============================================================================


# -----------------------------------------------------------------------------
# EXPORTS
# -----------------------------------------------------------------------------

## The Entity node that owns this hurtbox and will receive damage calls.
@export var entity_owner: Entity

@export var defense_multiplier: float = 1.0  # 1.0 = full damage, 0.5 = half
@export var enabled: bool = true


# -----------------------------------------------------------------------------
# SIGNALS
# -----------------------------------------------------------------------------

## Emitted when damage is received, before applying to entity.
signal damaged(amount: float, source: HitboxComponent)


# -----------------------------------------------------------------------------
# LIFECYCLE
# -----------------------------------------------------------------------------
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	set_deferred("monitoring", enabled)


# -----------------------------------------------------------------------------
# DETECTION
# -----------------------------------------------------------------------------
func _on_area_entered(area: Area2D) -> void:
	if not enabled:
		return
	if not area is HitboxComponent:
		return

	var hitbox := area as HitboxComponent
	if not hitbox.enabled:
		return

	var final_damage := hitbox.damage * defense_multiplier
	damaged.emit(final_damage, hitbox)

	if entity_owner:
		entity_owner.take_damage(final_damage, hitbox.get_owner())
	else:
		push_warning("[HurtboxComponent] No entity_owner assigned on: %s" % get_parent().name)


# -----------------------------------------------------------------------------
# CONTROL
# -----------------------------------------------------------------------------
func enable() -> void:
	enabled = true
	set_deferred("monitoring", true)


func disable() -> void:
	enabled = false
	set_deferred("monitoring", false)
