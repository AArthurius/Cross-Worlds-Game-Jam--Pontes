extends Resource
class_name GunLicense

enum GunsTypes {Fire, Melee}
enum Countries {Brazil, Germany, Portugal, Canada, USA, England}

@export var GunName: String
@export var Sprite: Texture2D
@export var Validaty: String
@export var Type: GunsTypes
@export var Number: String
@export var bearerCountry: Countries

func getCountryName() -> String:
	return Countries.keys()[bearerCountry]

func getWeaponType() -> String:
	return GunsTypes.keys()[Type]
