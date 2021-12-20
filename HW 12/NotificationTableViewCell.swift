//
//  NotificationTableViewCell.swift
//  HW 12
//
//  Created by Ольга on 20.12.2021.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    static let identifire = "NotificationTableViewCel"
    
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
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemGray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(iconContainer)
        contentView.addSubview(label)
        contentView.addSubview(notificationLabel)
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
        
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 10).isActive = true
        
        notificationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        notificationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    // MARK: - Configure
    
    func configure(with settings: NotificationSettingOptions) {
        label.text = settings.title
        iconImageView.image = settings.icon
        iconContainer.backgroundColor = settings.iconBackgroundColor
        notificationLabel.text = settings.notification
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
        label.text = nil
        iconContainer.backgroundColor = nil
        notificationLabel.text = nil
    }
}
