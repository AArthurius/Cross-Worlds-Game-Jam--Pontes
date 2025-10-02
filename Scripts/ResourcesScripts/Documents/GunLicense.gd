extends Resource
class_name GunLicense

enum GunsTypes {Fire, Melee}
enum Countries {Brazil, Germany, Portugal, Canada, USA, England}

@export var Validaty: String
@export var Type: GunsTypes
@export var Number: String
@export var bearerCountry: Countries
