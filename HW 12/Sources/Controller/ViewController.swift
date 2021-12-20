//
//  ViewController.swift
//  HW 12
//
//  Created by Ольга on 02.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var settings = [Section]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        configure()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SettingTableViewCell.self,
                           forCellReuseIdentifier: SettingTableViewCell.identifire)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.identifire)
        tableView.register(NotificationTableViewCell.self,
                           forCellReuseIdentifier: NotificationTableViewCell.identifire)
    }

    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        settings.append(Section(title: "First", options: [
            
            .switchCell(type: SettingSwitchOptions(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: .systemOrange, isOn: true)),
            .notificationCell(type:NotificationSettingOptions(
                title: "Wi-Fi",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: .systemBlue,
                notification: "Выкл.")),
            .notificationCell(type:NotificationSettingOptions(
                title: "Bluetooth", icon: UIImage(named: "bluetooth"),
                iconBackgroundColor: .systemBlue,
                notification: "Вкл.")),
            .staticCell(type:SettingOptions(
                title: "Сотовая связь",
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                iconBackgroundColor: .systemGreen)),
            .staticCell(type:SettingOptions(
                title: "Режим модема",
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundColor: .systemGreen))
        ]))
        
        settings.append(Section(title: "Second", options: [
            .staticCell(type:SettingOptions(
                title: "Уведомления",
                icon: UIImage(systemName: "dot.square"),
                iconBackgroundColor: .systemRed)),
            .staticCell(type:SettingOptions(
                title: "Звуки, тактильные сигналы",
                icon: UIImage(systemName: "speaker.wave.3.fill"),
                iconBackgroundColor: .systemRed)),
            .staticCell(type:SettingOptions(
                title: "Не беспокоить",
                icon: UIImage(systemName: "moon.fill"),
                iconBackgroundColor: .systemPurple)),
            .staticCell(type:SettingOptions(
                title: "Экранное время",
                icon: UIImage(systemName: "hourglass"),
                iconBackgroundColor: .systemPurple))
        ]))
        
        settings.append(Section(title: "Third", options: [
            .staticCell(type:SettingOptions(
                title: "Основные",
                icon: UIImage(systemName: "gear"),
                iconBackgroundColor: .systemGray)),
            .staticCell(type:SettingOptions(
                title: "Пункт управления",
                icon: UIImage(systemName: "switch.2"),
                iconBackgroundColor: .systemGray)),
            .staticCell(type:SettingOptions(
                title: "Экран и яркость",
                icon: UIImage(systemName: "textformat.size"),
                iconBackgroundColor: .systemBlue)),
            .staticCell(type:SettingOptions(
                title: "Экран «Домой»",
                icon: UIImage(systemName: "apps.iphone"),
                iconBackgroundColor: .systemBlue)),
            .staticCell(type:SettingOptions(
                title: "Универсальный доступ",
                icon: UIImage(named: "accessibility"),
                iconBackgroundColor: .systemBlue)),
            .staticCell(type:SettingOptions(
                title: "Обои",
                icon: UIImage(named: "ios-photos"),
                iconBackgroundColor: .systemTeal)),
            .staticCell(type:SettingOptions(
                title: "Siri и Поиск",
                icon: UIImage(systemName: "magnifyingglass"),
                iconBackgroundColor: .black)),
            .staticCell(type:SettingOptions(
                title: "Face ID и код-пароль",
                icon: UIImage(systemName: "faceid"),
                iconBackgroundColor: .systemGreen)),
            .staticCell(type:SettingOptions(
                title: "Экстренный вызов - SOS",
                icon: UIImage(systemName: "phone.fill.connection"),
                iconBackgroundColor: .systemRed)),
            .staticCell(type:SettingOptions(
                title: "Уведомления о контакте",
                icon: UIImage(systemName: "sun.min.fill"),
                iconBackgroundColor: .systemRed)),
            .staticCell(type:SettingOptions(
                title: "Аккумулятор",
                icon: UIImage(systemName: "battery.100"),
                iconBackgroundColor: .systemGreen)),
            .staticCell(type:SettingOptions(
                title: "Конфиденциальность",
                icon: UIImage(systemName: "hand.raised.fill"),
                iconBackgroundColor: .systemBlue))
        ]))
    }
    
    // MARK: - DataSourse methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section].options[indexPath.row]
        
        switch setting.self {
        case .staticCell(let setting):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifire,
                for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
            }
            cell.accessoryType = .disclosureIndicator
            cell.configure(with: setting)
            return cell
        case .switchCell(let setting):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifire,
                for: indexPath) as? SwitchTableViewCell else {
                    return UITableViewCell()
            }
            cell.accessoryType = .none
            cell.selectionStyle = .none
            cell.configure(with: setting)
            return cell
        case .notificationCell(let setting):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationTableViewCell.identifire,
                for: indexPath) as? NotificationTableViewCell else {
                    return UITableViewCell()
                }
            cell.accessoryType = .disclosureIndicator
            cell.configure(with: setting)
            return cell
        }
    }
    
    // MARK: - Delegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.section].options[indexPath.row]
        switch setting.self {
        case .staticCell(let setting):
            tableView.deselectRow(at: indexPath, animated: true)
            print("Нажата кнопка \(setting.title).")
        case .notificationCell(let setting):
            tableView.deselectRow(at: indexPath, animated: true)
            print("Нажата кнопка \(setting.title).")
        case .switchCell:
            return
        }
    }
}

