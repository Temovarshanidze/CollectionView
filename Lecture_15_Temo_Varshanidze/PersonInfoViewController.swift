import UIKit

class PersonInfoViewController: UIViewController {
    let personCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    let sortAscendingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sort Ascending", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sortDescendingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sort Descending", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let genderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Gender", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var person = [
        People(name: "John", age: 30, gender: .male),
        People(name: "Tonny", age: 57, gender: .male),
        People(name: "Jesica", age: 45, gender: .female),
        People(name: "Deborah", age: 42, gender: .female),
        People(name: "Jimmy", age: 21, gender: .male),
        People(name: "Julia", age: 35, gender: .female),
        People(name: "James", age: 36, gender: .male),
        People(name: "Cristopher", age: 29, gender: .male),
        People(name: "Monika", age: 49, gender: .female),
        People(name: "Naomi", age: 54, gender: .female),
        People(name: "Jackson", age: 17, gender: .male),
        People(name: "Fiona", age: 67, gender: .female)
    ]
    
    var person2: [People] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setUpButtons()
        setupCollectionView()
        setButtonTargets()
    }
    
    private func setUpButtons() {
        view.addSubview(sortAscendingButton)
        view.addSubview(sortDescendingButton)
        view.addSubview(genderButton)
        
        NSLayoutConstraint.activate([
            sortAscendingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            sortAscendingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sortAscendingButton.heightAnchor.constraint(equalToConstant: 40),
            
            genderButton.topAnchor.constraint(equalTo: sortAscendingButton.topAnchor),
            genderButton.leadingAnchor.constraint(equalTo: sortAscendingButton.trailingAnchor, constant: 20),
            genderButton.widthAnchor.constraint(equalTo: sortAscendingButton.widthAnchor),
            genderButton.heightAnchor.constraint(equalToConstant: 40),
            
            sortDescendingButton.topAnchor.constraint(equalTo: sortAscendingButton.topAnchor),
            sortDescendingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sortDescendingButton.leadingAnchor.constraint(equalTo: genderButton.trailingAnchor, constant: 20),
            sortDescendingButton.widthAnchor.constraint(equalTo: sortAscendingButton.widthAnchor),
            sortDescendingButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(personCollectionView)
        
        NSLayoutConstraint.activate([
            personCollectionView.topAnchor.constraint(equalTo: sortAscendingButton.bottomAnchor, constant: 15),
            personCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            personCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            personCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
        
        personCollectionView.register(PersonCell.self, forCellWithReuseIdentifier: "PersonCell")
        personCollectionView.register(PersonCellThwo.self, forCellWithReuseIdentifier: "PersonCellThwo")
        personCollectionView.dataSource = self
        personCollectionView.delegate = self
    }
    
    private func setButtonTargets() {
        sortAscendingButton.addAction(UIAction (handler: {[weak self] _ in
            self?.person.sort {$0.age > $1.age}
            self?.person2.sort {$0.age > $1.age}
            self?.personCollectionView.reloadData()
        }), for: .touchUpInside)
        
        genderButton.addAction(UIAction (handler: {[weak self] _ in
            self?.sortByGender()
        }), for: .touchUpInside)
        
        sortDescendingButton.addAction(UIAction (handler: {[weak self] _ in
            self?.person.sort {$0.age > $1.age}
            self?.person2.sort {$0.age > $1.age}
            self?.personCollectionView.reloadData()
        }), for: .touchUpInside)
    }
    
      private func sortByGender() {
        person.sort { $0.gender < $1.gender }
        person2.sort { $0.gender < $1.gender  }
        personCollectionView.reloadData()
    }
}

extension PersonInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return person.count
        }
        else {
            return person2.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as? PersonCell {
                let someone = person[indexPath.row]
                cell.configure(with: someone)
                cell.delegate = self
                cell.addPersonToOtherArray = { [weak self] in
                    self?.person2.append(someone)
                    self?.personCollectionView.reloadData()
                }
                return cell
                
            }
            else {
                return UICollectionViewCell()
            }
        }
        else {
            if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCellThwo", for: indexPath) as? PersonCellThwo {
                let someone = person2[indexPath.row]
                cell.configure(with: someone)
                return cell
            }
            else {
                
                return UICollectionViewCell()
            }
        }
    }
}
extension PersonInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 100)
    }
}


extension PersonInfoViewController: PersonRemoveDelegate    {
    func removePerson(cell: PersonCell) {
        if  let indexPath = personCollectionView.indexPath(for: cell) {
            person.remove(at: indexPath.row)
            personCollectionView.reloadData()
        }
    }
}
