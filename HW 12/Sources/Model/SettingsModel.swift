//
//  SettingsModel.swift
//  HW 12
//
//  Created by Ольга on 20.12.2021.
//

import UIKit

final class SettingsModel {
    
    func createModels() -> [Section] {
        return [
            Section(title: "First", options: [
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
            ]),
            Section(title: "Second", options: [
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
            ]),
            Section(title: "Third", options: [
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
            ])
        ]
    }
}
