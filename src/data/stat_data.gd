extends Resource
class_name StatData

# =============================================================================
# STAT DATA
# Defines the base statistics for any character (player, enemy, NPC).
# Attach to CharacterBase as a Resource asset (.tres).
#
# Stats are stored in a Dictionary — flexible and iterable.
# Use the helper methods to get/set/modify values safely.
#
# These are BASE values — modifiers, buffs, and equipment bonuses
# are applied on top at runtime, not stored here.
# =============================================================================


# -----------------------------------------------------------------------------
# DEFAULTS
# Used to initialize stats and as fallback for missing keys.
# Add new stats here to make them available across the whole system.
# -----------------------------------------------------------------------------
const DEFAULTS: Dictionary = {
	# Vitals
	"max_health":           100.0,
	"health_regen":         0.0,    # Per second. 0 = no regen.
	# Movement
	"move_speed":           200.0,
	"acceleration":         800.0,
	"friction":             600.0,
	# Combat
	"base_damage":          10.0,
	"defense":              0.0,    # Flat damage reduction.
	"knockback_resistance": 0.0,
}


# -----------------------------------------------------------------------------
# DATA
# Override individual values per character in the editor or via code.
# Missing keys fall back to DEFAULTS automatically.
# -----------------------------------------------------------------------------
@export var stats: Dictionary = {}


# -----------------------------------------------------------------------------
# HELPERS
# -----------------------------------------------------------------------------

## Returns the value of a stat, falling back to DEFAULTS if not set.
func get_stat(key: String) -> float:
	if stats.has(key):
		return stats[key]
	if DEFAULTS.has(key):
		return DEFAULTS[key]
	push_warning("[StatData] Unknown stat key: '%s'" % key)
	return 0.0


## Sets a stat value directly.
func set_stat(key: String, value: float) -> void:
	if not DEFAULTS.has(key):
		push_warning("[StatData] Setting unknown stat key: '%s'" % key)
	stats[key] = value


## Returns a merged copy of DEFAULTS overridden by this resource's stats.
## Use this to get the full resolved stat sheet.
func get_resolved() -> Dictionary:
	return DEFAULTS.merged(stats, true)
