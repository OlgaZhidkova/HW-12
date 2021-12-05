//
//  SettingTableViewCell.swift
//  HW 12
//
//  Created by Ольга on 04.12.2021.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    static let identifire = "SettingTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
//        view.backgroundColor = .systemGray
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(lable)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    private func setupLayout() {
        iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.widthAnchor.constraint(equalToConstant: size).isActive = true
        iconContainer.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: (size - (size/1.5))/2).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: size/1.5).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: size/1.5).isActive = true
        
        lable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        lable.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 10).isActive = true
        lable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
       
    }
    
    // MARK: - Configure
    
    func configure(with settings: SettingOptions) {
        lable.text = settings.title
        iconImageView.image = settings.icon
        iconContainer.backgroundColor = settings.iconBackgroundColor
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
    }

}
