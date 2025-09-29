extends Resource

enum CitadelWorks {None, Saloon, Sheriff, Hotel, PrisonGovernment, Bridge}

@export var npcProfileImage: Texture2D
@export var npcName: String
@export var npcAge: int
@export var npcCountry: String
@export var npcCitadelWork: CitadelWorks
