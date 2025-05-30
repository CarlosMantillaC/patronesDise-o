import UIKit

let houseCollectionView = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
]

class UICollectionViewViewController: UIViewController, UICollectionViewDataSource {
    
    private let swiftBetaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 60)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }() 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = "House Collection View"

        swiftBetaCollectionView.backgroundColor = .white
        swiftBetaCollectionView.dataSource = self
        swiftBetaCollectionView.register(SwiftBetaCollectionViewCell.self, forCellWithReuseIdentifier: "SwiftBetaCollectionViewCell")

        view.addSubview(swiftBetaCollectionView)
        
        NSLayoutConstraint.activate([
            swiftBetaCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            swiftBetaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftBetaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftBetaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houseCollectionView.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwiftBetaCollectionViewCell", for: indexPath) as! SwiftBetaCollectionViewCell
        cell.backgroundColor = .red

        let model = houseCollectionView[indexPath.row]
        cell.configure(model: model)


        return cell
    }
    

}