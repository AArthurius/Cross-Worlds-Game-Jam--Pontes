extends Resource
class_name NPCID

enum CitadelWorks {None, Saloon, Sheriff, Hotel, Prison_Government, Bridge}
enum Countries {Brazil, United_Kingdoom, Germany, Portugal}

@export var npcProfileImage: Texture2D
@export var npcName: String
@export var npcAge: int
@export var npcCountry: Countries
@export var npcCitadelWork: CitadelWorks


func assignAtributes(atributes: NPCAtributes):
	npcProfileImage = atributes.NPCTexture
	npcName = atributes.npcName
	npcAge = atributes.npcAge
	npcCountry = atributes.npcCountry
	npcCitadelWork = atributes.npcCitadelWork

func getCountryName() -> String:
	return Countries.keys()[npcCountry]

func getWorkName() -> String:
	return CitadelWorks.keys()[npcCitadelWork]
