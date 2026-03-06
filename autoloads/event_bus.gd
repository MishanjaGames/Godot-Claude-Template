extends Node

# =============================================================================
# EVENT BUS
# Global signal router. All systems communicate through here.
# No node should hold a direct reference to another just to send a signal.
#
# Usage:
#   Emit:   EventBus.player_died.emit()
#   Listen: EventBus.player_died.connect(_on_player_died)
# =============================================================================


# -----------------------------------------------------------------------------
# ENTITY
# -----------------------------------------------------------------------------
signal entity_died(entity: Node)
signal entity_damaged(entity: Node, amount: float, source: Node)
signal entity_healed(entity: Node, amount: float)


# -----------------------------------------------------------------------------
# PLAYER
# -----------------------------------------------------------------------------
signal player_health_changed(current: float, maximum: float)
signal player_died


# -----------------------------------------------------------------------------
# COMBAT
# -----------------------------------------------------------------------------
signal hitbox_entered(hitbox: Area2D, hurtbox: Area2D)


# -----------------------------------------------------------------------------
# WORLD
# -----------------------------------------------------------------------------
signal scene_change_requested(scene_path: String)
signal scene_loaded(scene_path: String)


# -----------------------------------------------------------------------------
# UI
# -----------------------------------------------------------------------------
signal ui_open_requested(ui_key: String)
signal ui_close_requested(ui_key: String)
