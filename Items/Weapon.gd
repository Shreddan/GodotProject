extends InventoryItem

class_name Weapon

enum WType {DAGGER, SWORD, LONGSWORD, SPEAR, STAFF, BOW}

@export var WeaponType: int
@export var Damage: int
@export var TwoHand: bool


func on_ready():
	self.Type = 0
