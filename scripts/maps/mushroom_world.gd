extends YumeWorld

@onready var white_mushroom_field := $WhiteMushroomField

func _init() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _ready() -> void:
	Game.music_player.stream = preload("res://music/bgm-r.wav")
	Game.music_player.play()
	Game.create_tween().tween_property(Game.music_player, "volume_db", linear_to_db(1.0), 5.0)
	Game.transition_handler.play("fade_in")
	white_mushroom_field.visible = false
	white_mushroom_field.process_mode = Node.PROCESS_MODE_DISABLED
	await Game.transition_handler.animation_finished
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_teleport_body_interacted(body: Node2D) -> void:
	if body is YumePlayer:
		process_mode = Node.PROCESS_MODE_DISABLED
		Game.transition_handler.play("fade_out")
		await Game.transition_handler.animation_finished
		Game.music_player.stream = preload("res://music/bgm-r melo.wav")
		Game.music_player.play()
		Game.transition_handler.play("fade_in")
		body.facing = YumeCharacter.DIRECTION.DOWN

		if body.position.x < -448.0:
			body.position = Vector2(-24.0, -104.0)
		else:
			body.position = Vector2(-8, -104.0)

		await Game.transition_handler.animation_finished
		process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_teleport_2_body_interacted(body: Node2D) -> void:
	if body is YumePlayer:
		process_mode = Node.PROCESS_MODE_DISABLED
		Game.transition_handler.play("fade_out")
		await Game.transition_handler.animation_finished
		Game.music_player.stream = preload("res://music/bgm-r.wav")
		Game.music_player.play()
		body.facing = YumeCharacter.DIRECTION.DOWN

		if body.position.x < -16.0:
			body.position = Vector2(-456.0, 376.0)
		else:
			body.position = Vector2(-440.0, 376.0)

		Game.transition_handler.play("fade_in")
		await Game.transition_handler.animation_finished
		process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_teleport_3_body_stepped_on(body: Node2D) -> void:
	if body is YumePlayer:
		await get_tree().physics_frame

		if body.is_moving:
			await body.moved

		process_mode = Node.PROCESS_MODE_DISABLED
		Game.transition_handler.play("pixelate_out")
		await Game.transition_handler.animation_finished
		modulate.a = 0.0
		white_mushroom_field.visible = true
		body.collision_layer = 8
		body.collision_mask = 8
		body.facing = YumeCharacter.DIRECTION.UP
		body.reparent(white_mushroom_field)

		if body.position.x < -16.0:
			body.position = Vector2(8.0, -24.0)
		else:
			body.position = Vector2(24.0, -24.0)

		Game.transition_handler.play("pixelate_in")
		await Game.transition_handler.animation_finished
		white_mushroom_field.process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_teleport_4_body_stepped_on(body: Node2D) -> void:
	if body is YumePlayer:
		await get_tree().physics_frame

		if body.is_moving:
			await body.moved

		white_mushroom_field.process_mode = Node.PROCESS_MODE_DISABLED
		Game.transition_handler.play("pixelate_out")
		await Game.transition_handler.animation_finished
		modulate.a = 1.0
		white_mushroom_field.visible = false
		body.collision_layer = 2
		body.collision_mask = 2
		body.facing = YumeCharacter.DIRECTION.UP
		body.reparent(self)

		if body.position.x < 16.0:
			body.position = Vector2(-24.0, -24.0)
		else:
			body.position = Vector2(-8.0, -24.0)

		Game.transition_handler.play("pixelate_in")
		await Game.transition_handler.animation_finished
		process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_teleport_5_body_interacted(body: Node2D) -> void:
	if body is YumePlayer:
		white_mushroom_field.process_mode = Node.PROCESS_MODE_DISABLED
		Game.transition_handler.play("fade_out")
		await Game.transition_handler.animation_finished
		body.facing = YumeCharacter.DIRECTION.DOWN

		if body.position.x < 16.0:
			body.position = Vector2(-408.0, 328.0)
		else:
			body.position = Vector2(-392.0, 328.0)

		Game.transition_handler.play("fade_in")
		await Game.transition_handler.animation_finished
		white_mushroom_field.process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_teleport_6_body_interacted(body: Node2D) -> void:
	if body is YumePlayer:
		white_mushroom_field.process_mode = Node.PROCESS_MODE_DISABLED
		Game.transition_handler.play("fade_out")
		await Game.transition_handler.animation_finished
		body.facing = YumeCharacter.DIRECTION.DOWN

		if body.position.x < -400.0:
			body.position = Vector2(8.0, -88.0)
		else:
			body.position = Vector2(24.0, -88.0)

		Game.transition_handler.play("fade_in")
		await Game.transition_handler.animation_finished
		white_mushroom_field.process_mode = Node.PROCESS_MODE_PAUSABLE
