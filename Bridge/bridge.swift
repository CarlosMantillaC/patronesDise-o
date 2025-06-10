protocol Device {
    
    func turnOn()
    func turnOff()
    func setVolume(_ percent: Int)

}

class Radio: Device {
    
    func turnOn() {
        print("encendiendo radio")
    }
    
    func turnOff() {
        print("apagando radio")
    }
    
    func setVolume(_ percent: Int) {
        print("volumen ajustado \(percent)")
    }
    
}

class Tv: Device {
    
    func turnOn() {
        print("encendiendo tv")
    }
    
    func turnOff() {
        print("apagando tv")
    }
    
    func setVolume(_ percent: Int) {
        print("volumen ajustado \(percent)")
    }

}

class RemoteControl {
    
    var device: Device
    
    init(device: Device) {
        self.device = device
    }
    
    func turnOn() {
        device.turnOn()
    }
    
    func turnOff() {
        device.turnOff()
    }
    
    func setVolume(_ percent: Int) {
        device.setVolume(percent)
    }
}

let radio = Radio()

let remoteControl = RemoteControl(device: radio)

remoteControl.turnOff()
