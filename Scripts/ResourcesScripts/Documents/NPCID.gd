extends Resource
class_name NPCID

enum CitadelWorks {None, Saloon, Sheriff, Hotel, Prison_Government, Bridge, Church}
enum Countries {Brazil, Germany, Portugal, Canada, USA, England, Scandinavia}
enum Sex {Male, Female}

@export var npcProfileImage: Texture2D
@export var npcName: String
@export var npcAge: int
@export var npcSex: int
@export var npcCountry: Countries
@export var npcCitadelWork: CitadelWorks

var npcInformations: Array = [npcProfileImage, npcName, npcAge, npcSex]

var npcNames: Array = ["Clarice Wagner Sterling", "Derick Frost III", "Helena Cowboy da Silva", "Julian Duque Thompson", "Mary Lindovan Fischer", "Rose Whitmore Monroe", "Santiago Xavier Morais"]
var npcProfileImages: Array = [preload("res://Assets/NPCs/Clarice Wagner Sterling.png"), preload("res://Assets/NPCs/Derick Frost III.png"), preload("res://Assets/NPCs/Helena Cowboy da Silva.png"), preload("res://Assets/NPCs/Julian Duque Thompson.png"), preload("res://Assets/NPCs/Mary Lindovan Fischer.png"), preload("res://Assets/NPCs/Rose Whitmore Monroe.png"), preload("res://Assets/NPCs/Santiago Xavier Morais.png")]

func assignAtributes(atributes: NPCAtributes, canAcross: bool) -> NPCID:
	if canAcross:
		npcProfileImage = atributes.NPCTexture
		npcName = atributes.npcName
		npcAge = atributes.npcAge
		npcSex = atributes.npcSex
		npcCountry = atributes.npcCountry
		npcCitadelWork = atributes.npcCitadelWork
	else:
		var falseInformation = randi_range(0, 3)

		match falseInformation:
			0:
				npcName = atributes.npcName
				npcAge = atributes.npcAge
				npcSex = atributes.npcSex
				npcCountry = atributes.npcCountry
				npcCitadelWork = atributes.npcCitadelWork

				var new_image = atributes.NPCTexture
				while new_image == atributes.NPCTexture:
					new_image = npcProfileImages[randi_range(0, npcProfileImages.size() - 1)]
				npcProfileImage = new_image
			1:
				npcProfileImage = atributes.NPCTexture
				npcAge = atributes.npcAge
				npcSex = atributes.npcSex
				npcCountry = atributes.npcCountry
				npcCitadelWork = atributes.npcCitadelWork
				var new_name = atributes.npcName
				while new_name == atributes.npcName:
					new_name = npcNames[randi_range(0, npcNames.size() - 1)]
				npcName = new_name
			2:
				npcProfileImage = atributes.NPCTexture
				npcName = atributes.npcName
				npcSex = atributes.npcSex
				npcCountry = atributes.npcCountry
				npcCitadelWork = atributes.npcCitadelWork
				npcAge = randi_range(100, 200)
			3:
				npcProfileImage = atributes.NPCTexture
				npcName = atributes.npcName
				npcAge = atributes.npcAge
				npcCountry = atributes.npcCountry
				npcCitadelWork = atributes.npcCitadelWork
				npcSex = Sex.Female if atributes.npcSex == Sex.Male else Sex.Male
	var NewNPCAtributes = NPCID.new()
	NewNPCAtributes.npcProfileImage = npcProfileImage
	NewNPCAtributes.npcName = npcName
	NewNPCAtributes.npcAge = npcAge
	NewNPCAtributes.npcSex = npcSex
	NewNPCAtributes.npcCountry = npcCountry
	NewNPCAtributes.npcCitadelWork = npcCitadelWork

	return NewNPCAtributes

func getCountryName() -> String:
	return Countries.keys()[npcCountry]

func getWorkName() -> String:
	return CitadelWorks.keys()[npcCitadelWork]

func getSex() -> String:
	return Sex.keys()[npcSex]
