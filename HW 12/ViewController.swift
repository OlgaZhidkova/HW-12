//
//  ViewController.swift
//  HW 12
//
//  Created by Ольга on 02.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var settings = [SettingOptions]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        configure()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifire)
    }

    // MARK: - Settings
    
    private func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - Functions
    
    func configure() {
        self.settings = Array(1...100).compactMap({
            SettingOptions(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemGray)
        })
    }
    
    // MARK: - DataSourse methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifire, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: setting)
        return cell
    }
    
    // MARK: - Delegate methods
    
}

struct SettingOptions {
    let title: String?
    let icon: UIImage?
    let iconBackgroundColor: UIColor
}
