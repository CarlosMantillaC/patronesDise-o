protocol Character {
    
    var name: String { get set }
    var characterClass: String { get set }
    var armor: String { get set }
    var weapon: String { get set }
    var power: String? { get set }
    var pet: String? { get set }
}

class RPGCharacter: Character {
    var name: String = ""
    var characterClass: String = ""
    var armor: String = ""
    var weapon: String = ""
    var power: String? = nil
    var pet: String? = nil
}

class PrintCharacter {
    static func show(character: Character) {
        print("Nombre: \(character.name)")
        print("Clase: \(character.characterClass)")
        print("Armadura: \(character.armor)")
        print("Arma: \(character.weapon)")
        print("Poder: \(character.power ?? "no tiene")")
        print("Mascota: \(character.pet ?? "no tiene")")
    }
}

protocol CharacterBuilder {
    func setName(_ name: String)
    func setClass(_ characterClass: String)
    func setArmor(_ armor: String)
    func setWeapon(_ weapon: String)
    
    func setSpecialPower(_ power: String)
    func setPet(_ pet: String)
    
    func build() -> Character
}

class RPGCharacterBuilder: CharacterBuilder {
    
    var character = RPGCharacter()
    
    func setName(_ name: String) {
        character.name = name
    }
    
    func setClass(_ characterClass: String) {
        character.characterClass = characterClass
    }
    
    func setArmor(_ armor: String) {
        character.armor = armor
    }
    
    func setWeapon(_ weapon: String) {
        character.weapon = weapon
    }
    
    func setSpecialPower(_ power: String) {
        character.power = power
    }
    
    func setPet(_ pet: String) {
        character.pet = pet
    }
    
    func build() -> any Character {
        return character
    }
    

}


let builder = RPGCharacterBuilder()

builder.setName("juan")
builder.setArmor("arma1")
builder.setClass("class1")
builder.setWeapon("weapon1")

let builderListo = builder.build()

PrintCharacter.show(character: builderListo)
