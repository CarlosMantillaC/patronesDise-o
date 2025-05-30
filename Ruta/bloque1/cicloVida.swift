class LifeCycleViewController: UIViewController {

    deinit {
        print("barrer memoria \(self.description)") //cuando se destruye la vista
    }

    private lazy var swiftBetaButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Swift Beta"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {  [weak self] action in self?.presentCurrentViewController()
        }))

        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1. ViewDidLoad \(self.description)") //cuando se carga la vista por primera vez

        view.backgroundColor = [.systemBlue, .systemGreen, .systemRed, .systemOrange].randomElement()
        view.addSubview(swiftBetaButton)

        buttonConstraint = swiftBetaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)

    
        NSLayoutConstraint.activate([
            swiftBetaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).
            buttonConstraint!
        ])

    }

    func presentCurrentViewController() {
        self.present(LifeCycleViewController(), animated: true)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2. ViewWillAppear \(self.description)") //cuando la vista va a aparecer en pantalla
    }


    func changeConstraintValue() {
        view.removeConstraint(buttonConstraint!)
        buttonConstraint = swiftBetaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        NSLayoutConstraint.activate([
            swiftBetaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonConstraint!
        ])
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("3. ViewWillLayoutSubviews \(self.description)") //cuando la vista va a cambiar su diseño
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("4. ViewDidLayoutSubviews \(self.description)") //cuando la vista ya ha cambiado su diseño
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5. ViewDidAppear \(self.description)") //cuando la vista ya ha aparecido en pantalla
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6. ViewWillDisappear \(self.description)") //cuando la vista va a desaparecer de pantalla
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("7. ViewDidDisappear \(self.description)") //cuando la vista ya ha desaparecido de pantalla
    }



}