extends Area2D
class_name HitboxComponent

# =============================================================================
# HITBOX COMPONENT
# Attached to anything that DEALS damage — weapons, projectiles, traps.
# When it overlaps a HurtboxComponent, it emits a signal with damage info.
# What happens next is the hurtbox owner's responsibility.
#
# Usage:
#   - Add as child node to any attacking entity or weapon
#   - Set damage value via export or at runtime
#   - Connect to hit signal if local handling is needed
#   - Everything else routes through EventBus
# =============================================================================


# -----------------------------------------------------------------------------
# EXPORTS
# -----------------------------------------------------------------------------
@export var damage: float = 10.0
@export var knockback_force: float = 0.0
@export var enabled: bool = true


# -----------------------------------------------------------------------------
# SIGNALS
# -----------------------------------------------------------------------------

## Emitted when this hitbox overlaps a valid hurtbox.
signal hit(hurtbox: HurtboxComponent, damage: float)


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
	if not area is HurtboxComponent:
		return
	# Don't hit hurtboxes owned by the same parent
	if area.get_owner() == get_owner():
		return

	var hurtbox := area as HurtboxComponent
	hit.emit(hurtbox, damage)
	EventBus.hitbox_entered.emit(self, hurtbox)


# -----------------------------------------------------------------------------
# CONTROL
# -----------------------------------------------------------------------------
func enable() -> void:
	enabled = true
	set_deferred("monitoring", true)


func disable() -> void:
	enabled = false
	set_deferred("monitoring", false)
