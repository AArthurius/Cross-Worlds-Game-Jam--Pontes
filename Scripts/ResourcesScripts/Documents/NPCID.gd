extends Resource
class_name NPCID

enum CitadelWorks {None, Saloon, Sheriff, Hotel, Prison_Government, Bridge}
enum Countries {Brazil, Germany, Portugal, Canada, USA, England, Scandinavia}
enum Sex {Male, Female}

@export var npcProfileImage: Texture2D
@export var npcName: String
@export var npcAge: int
@export var npcSex: int
@export var npcCountry: Countries
@export var npcCitadelWork: CitadelWorks


func assignAtributes(atributes: NPCAtributes):
	npcProfileImage = atributes.NPCTexture
	npcName = atributes.npcName
	npcAge = atributes.npcAge
	npcSex = atributes.npcSex
	npcCountry = atributes.npcCountry
	npcCitadelWork = atributes.npcCitadelWork

func getCountryName() -> String:
	return Countries.keys()[npcCountry]

func getWorkName() -> String:
	return CitadelWorks.keys()[npcCitadelWork]

func getSex() -> String:
	return Sex.keys()[npcSex]
