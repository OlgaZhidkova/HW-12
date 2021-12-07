//
//  SwitchTableViewCell.swift
//  HW 12
//
//  Created by Ольга on 06.12.2021.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifire = "SwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.tintColor = .white
        return image
    }()
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 17)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemGreen
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
        return mySwitch
    }()

    @objc func toggle(_ sender: UISwitch) {
            if mySwitch.isOn {
                print("Нажата кнопка \(lable.text ?? "").")
            }
        }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(lable)
        contentView.addSubview(mySwitch)
    }
    
    private func setupLayout() {
        iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        iconContainer.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iconContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: 3).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        lable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        lable.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 10).isActive = true
       
        mySwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        mySwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    // MARK: - Configure
    
    func configure(with settings: SettingSwitchOptions) {
        lable.text = settings.title
        iconImageView.image = settings.icon
        iconContainer.backgroundColor = settings.iconBackgroundColor
        mySwitch.isOn = settings.isOn
    }
    
    // MARK: - Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        lable.text = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = false
    }
}

