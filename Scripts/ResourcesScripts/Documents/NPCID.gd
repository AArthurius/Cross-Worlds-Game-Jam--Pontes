extends Resource
class_name NPCID

enum CitadelWorks {None, Saloon, Sheriff, Hotel, Prison_Government, Bridge}
enum Countries {Brazil, United_Kingdoom, Germany, Portugal, Canada, United_States, England}
enum Sex {Male, Female}

@export var npcProfileImage: Texture2D
@export var npcName: String
@export var npcAge: int
@export var npcSex: Sex
@export var npcCountry: Countries
@export var npcCitadelWork: CitadelWorks
