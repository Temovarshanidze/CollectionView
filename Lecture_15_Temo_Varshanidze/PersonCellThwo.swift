

import UIKit

class PersonCellThwo: UICollectionViewCell {

        
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
        

      
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .brown
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
        
        
        private func setUpUI() {
               contentView.addSubview(nameLabel)
               contentView.addSubview(genderLabel)
               contentView.addSubview(ageLabel)
            nameLabel.textColor = .yellow
            genderLabel.textColor = .yellow
            ageLabel.textColor = .yellow
            
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            genderLabel.translatesAutoresizingMaskIntoConstraints = false
            ageLabel.translatesAutoresizingMaskIntoConstraints = false
            
               NSLayoutConstraint.activate([
                   nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                   nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                   
                   genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                   genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                   
                   ageLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5),
                   ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                   ageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                   
                   
               ])
           }
    }

