
import UIKit

protocol PersonRemoveDelegate: AnyObject {
    func removePerson(cell : PersonCell)
}

class PersonCell: UICollectionViewCell {
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let genderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    

    
    let removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Remove", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        return button
    }()
    
    weak var delegate: PersonRemoveDelegate?
    var addPersonToOtherArray: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setUpUI()
        
    }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
     func configure(with person: People) {
        nameLabel.text = "Name: \(person.name)"
        genderLabel.text = "Gender: \(person.gender)"
        ageLabel.text = "Age: \(person.age)"
    }
    
    @objc  func configureRemoveButton() {
        delegate?.removePerson(cell: self)
        addPersonToOtherArray?()
    }
    
    private func setUpUI() {
           contentView.addSubview(nameLabel)
           contentView.addSubview(genderLabel)
           contentView.addSubview(ageLabel)
        contentView.addSubview(removeButton)
        nameLabel.textColor = .black
        genderLabel.textColor = .black
        ageLabel.textColor = .black
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.addAction(UIAction (handler: {[weak self] action in
            self?.configureRemoveButton()
        }), for: .touchUpInside)
           NSLayoutConstraint.activate([
               nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
               nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
               
               genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
               genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
               
               ageLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5),
               ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
               ageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
               
               removeButton.topAnchor.constraint(equalTo: genderLabel.topAnchor, constant: 20),
               removeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15)
               
           ])
       }
}
