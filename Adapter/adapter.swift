protocol LegacyCardReader {
    
    func readOldCard()
}

class OldCardReader: LegacyCardReader {
    func readOldCard() {
        print("usando tarjeta vieja")
    }
}

protocol SecureCardReader {
    func readSecureData()
}


class OldCardAdapter: SecureCardReader {
    
    var oldCard: LegacyCardReader
    
    init(oldCard: LegacyCardReader ) {
        self.oldCard = oldCard
    }
    
    func readSecureData() {
        print("tarjeta segura")
        oldCard.readOldCard()
    }

}


let oldCard = OldCardReader()

let secureCard = OldCardAdapter(oldCard: oldCard)

secureCard.readSecureData()
