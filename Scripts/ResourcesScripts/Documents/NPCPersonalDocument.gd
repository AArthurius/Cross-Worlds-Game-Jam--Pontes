extends Resource

enum CitadelWorks {None, Saloon, Sheriff, Hotel, Prison_Government, Bridge}
enum Countries {Brazil, United_Kingdoom, Germany, Portugal}

@export var npcProfileImage: Texture2D
@export var npcName: String
@export var npcAge: int
@export var npcCountry: Countries
@export var npcCitadelWork: CitadelWorks
