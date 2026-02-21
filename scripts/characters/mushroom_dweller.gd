extends "res://scripts/ai/YumeCharacter/wanderer.gd"

@onready var sprite := $AnimatedSprite2D

@export_enum("Purple", "Blue", "Red", "White", "White+Eye", "LakeMonster")
var variant: String = "Purple":
	set(value):
		if sprite:
			sprite.animation = value

		variant = value

func _ready() -> void:
	super()
	sprite.animation = variant

func _move():
	sprite.play(variant)
	sprite.frame = 1
