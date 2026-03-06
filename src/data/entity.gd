extends Node2D
class_name Entity

# =============================================================================
# ENTITY
# Root class for all game objects — characters, interactables, anything alive
# or interactive in the world.
#
# Holds only what EVERY entity shares:
#   - Identity (display name)
#   - Health (current, max, alive state)
#   - Core signals routed through EventBus
#
# Do NOT add movement, AI, or input here.
# Extend via CharacterBase or InteractableBase instead.
# =============================================================================


# -----------------------------------------------------------------------------
# EXPORTS
# -----------------------------------------------------------------------------
@export var display_name: String = "Entity"
@export var max_health: float = 100.0


# -----------------------------------------------------------------------------
# STATE
# -----------------------------------------------------------------------------
var current_health: float = max_health
var is_dead: bool = false


# -----------------------------------------------------------------------------
# LIFECYCLE
# -----------------------------------------------------------------------------
func _ready() -> void:
	current_health = max_health


# -----------------------------------------------------------------------------
# HEALTH
# -----------------------------------------------------------------------------
func take_damage(amount: float, source: Node = null) -> void:
	if is_dead:
		return

	current_health = clampf(current_health - amount, 0.0, max_health)
	EventBus.entity_damaged.emit(self, amount, source)

	if current_health <= 0.0:
		die()


func heal(amount: float) -> void:
	if is_dead:
		return

	current_health = clampf(current_health + amount, 0.0, max_health)
	EventBus.entity_healed.emit(self, amount)


func die() -> void:
	if is_dead:
		return

	is_dead = true
	EventBus.entity_died.emit(self)
	_on_death()


# -----------------------------------------------------------------------------
# VIRTUAL — override in subclasses
# -----------------------------------------------------------------------------

## Called when this entity dies. Override to add death behavior.
func _on_death() -> void:
	pass


## Called to interact with this entity. Override in InteractableBase.
func interact(source: Node = null) -> void:
	pass
