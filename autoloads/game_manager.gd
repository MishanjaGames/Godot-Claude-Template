extends Node

# =============================================================================
# GAME MANAGER
# Global state and scene management.
# Handles scene transitions, game state tracking, and pause logic.
#
# Usage:
#   GameManager.change_scene("res://scenes/world/main_world.tscn")
#   GameManager.pause_game()
#   GameManager.current_state
# =============================================================================


# -----------------------------------------------------------------------------
# ENUMS
# -----------------------------------------------------------------------------
enum GameState {
	MAIN_MENU,
	PLAYING,
	PAUSED,
	GAME_OVER,
}


# -----------------------------------------------------------------------------
# STATE
# -----------------------------------------------------------------------------
var current_state: GameState = GameState.MAIN_MENU :
	set(value):
		var previous = current_state
		current_state = value
		_on_state_changed(previous, current_state)


# -----------------------------------------------------------------------------
# LIFECYCLE
# -----------------------------------------------------------------------------
func _ready() -> void:
	EventBus.scene_change_requested.connect(_on_scene_change_requested)


# -----------------------------------------------------------------------------
# SCENE MANAGEMENT
# -----------------------------------------------------------------------------
func change_scene(scene_path: String) -> void:
	EventBus.scene_change_requested.emit(scene_path)


func _on_scene_change_requested(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
	EventBus.scene_loaded.emit(scene_path)


# -----------------------------------------------------------------------------
# GAME STATE
# -----------------------------------------------------------------------------
func pause_game() -> void:
	if current_state == GameState.PLAYING:
		current_state = GameState.PAUSED
		get_tree().paused = true


func resume_game() -> void:
	if current_state == GameState.PAUSED:
		current_state = GameState.PLAYING
		get_tree().paused = false


func game_over() -> void:
	current_state = GameState.GAME_OVER
	get_tree().paused = true


func start_game(scene_path: String) -> void:
	current_state = GameState.PLAYING
	get_tree().paused = false
	change_scene(scene_path)


# -----------------------------------------------------------------------------
# INTERNAL
# -----------------------------------------------------------------------------
func _on_state_changed(from: GameState, to: GameState) -> void:
	print("[GameManager] State: %s -> %s" % [GameState.keys()[from], GameState.keys()[to]])
