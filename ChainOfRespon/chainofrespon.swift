protocol ValidatorHandler {
    func setNext(_ handler: ValidatorHandler)
    func handle(_ form: UserForm)
}

class BaseValidator: ValidatorHandler {
    
    private var next: ValidatorHandler?
    
    func setNext(_ handler: any ValidatorHandler){
        self.next = handler
    }
    
    func handle(_ form: UserForm){
        next?.handle(form)
    }
    
}

class UsernameValidator: BaseValidator {
    
    override func handle(_ form: UserForm) {
        guard form.username.count > 3 else {
            print("❌ Nombre de usuario debe tener más de 3 caracteres")
            return
        }
        return super.handle(form)
    }
}


class EmailValidator: BaseValidator {
    override func handle(_ form: UserForm) {
        guard form.email.contains("@") else {
            print("❌ El correo debe contener '@'")
            return
        }
        return super.handle(form)
    }
}


class PasswordValidator: BaseValidator {
    override func handle(_ form: UserForm) {
        guard form.password.count >= 8 else {
            print("❌ La contraseña debe tener al menos 8 caracteres")
            return
        }
        return super.handle(form)
    }
}

class UserForm {
    var username: String
    var email: String
    var password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
    
}

let userForm = UserForm(username: "jaja", email: "@dd", password: "2324")


let userName = UsernameValidator()
let email = EmailValidator()
let password = PasswordValidator()

userName.setNext(password)
password.setNext(email)

let isValid: () = userName.handle(userForm)
